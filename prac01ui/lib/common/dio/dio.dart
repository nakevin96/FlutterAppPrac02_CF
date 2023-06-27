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
}
