import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:prac01ui/common/const/data.dart';

class CustomInterceptor extends Interceptor {
// dio는 많은 기능들을 제공하며 intercept 기능은 매우 유용하다고 할 수 있습니다.
// dio의 intercept 기능은 아래와 같은 상황에서 사용이 가능합니다.
// 1) 요청을 보낼 때
// 2) 응답을 받을 때
// 3) 에러가 발생했을 때
// 이런 상황에서 중간에서 가로채서 다른 처리를 할 수 있습니다.

  final FlutterSecureStorage storage;

  CustomInterceptor({
    required this.storage,
  });

// 1) 요청을 보낼 때
// 요청을 보낼때 마다 header에 accessToken True가 있다면
// storage에서 acceessToken을 가져와서 header에 삽입하고 전송
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // onRequest는 실제 request가 보내지기 '전' 실행된다.
    // 토큰 자동 적용
    if (options.headers['accessToken'] == 'true') {
      // headers는 Map이기에 remove로 키 삭제 가능
      options.headers.remove('accessToken');

      final token = await storage.read(key: ACCESS_TOKEN_KEY);

      options.headers.addAll({
        'authorization': 'Bearer $token',
      });
    }

    if (options.headers['refreshToken'] == 'true') {
      // headers는 Map이기에 remove로 키 삭제 가능
      options.headers.remove('refreshToken');

      final token = await storage.read(key: REFRESH_TOKEN_KEY);

      options.headers.addAll({
        'authorization': 'Bearer $token',
      });
    }

    return super.onRequest(options, handler);
  }

  // 2) 응답을 받았을 때
  // TODO

  // 3) 에러가 났을 때
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // 토큰에 문제가 있을 때 401에러가 발생하게 되는데 (서버 마다 다름)
    // 이 에러가 발생했을 경우 토큰을 재발급 받는 시도를 하고 토큰을 재발급 받으면
    // 다시 새로운 토큰 요청
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);

    // refresh token이 없으면 에러를 던짐
    if (refreshToken == null) {
      // dio에서 에러 던지는 방법
      return handler.reject(err);
    }

    final isStatus401 = err.response?.statusCode == 401;
    final isPathRefresh = err.requestOptions.path == '/auth/token';

    if (isStatus401 && !isPathRefresh) {
      final dio = Dio();

      try {
        final resp = await dio.post(
          'http://$ip/auth/token',
          options: Options(
            headers: {
              'authorization': 'Bearer $refreshToken',
            },
          ),
        );

        final accessToken = resp.data['accessToken'];
        await storage.write(key: ACCESS_TOKEN_KEY, value: accessToken);

        final options = err.requestOptions;

        options.headers.addAll({
          'authorization': 'Bearer $accessToken',
        });

        // 요청 다시 보내기
        final response = await dio.fetch(options);

        // 정상 요청을 다시 보내서 error가 발생했지만 정상적으로 처리를 바꿀 수 있음
        return handler.resolve(response);
      } on DioException catch (e) {
        // token을 재발급 받을 수 없는 상황
        return handler.reject(e);
      }
    }

    return super.onError(err, handler);
  }
}
