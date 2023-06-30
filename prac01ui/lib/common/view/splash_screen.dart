// 이 스크린은 앱에 진입해서 데이터를 긁어와 어떤 페이지를 보여줘야 하는지 정한다.
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prac01ui/common/const/colors.dart';
import 'package:prac01ui/common/const/data.dart';
import 'package:prac01ui/common/dio/dio.dart';
import 'package:prac01ui/common/layout/defalut_layout.dart';
import 'package:prac01ui/common/secure_storage/secure_storage.dart';
import 'package:prac01ui/common/view/root_tab.dart';
import 'package:prac01ui/user/view/login_screen.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  // Dio는 서버와 통신을 하기 위한 flutter 패키지

  @override
  void initState() {
    super.initState();

    checkToken();
  }

  void checkToken() async {
    // final dio = Dio();
    final dio = ref.read(dioProvider);
    final storage = ref.read(secureStorageProvider);
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);
    try {
      final getAccessTokenResp = await dio.post(
        'http://$ip/auth/token',
        options: Options(headers: {
          'authorization': 'Bearer $refreshToken',
        }),
      );
      await storage.write(
          key: ACCESS_TOKEN_KEY, value: getAccessTokenResp.data['accessToken']);

      if (!mounted) return;
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const RootTab()),
        (route) => false,
      );
    } catch (e) {
      // async함수 내에서 buildContext를 쓰기 위해서 필요
      // 위젯이 마운트 되지 않으면 async뒤에 context를 썼을 때 안에 아무런 값이 들어있지 않을 수도 있기 떄문
      if (!mounted) return;
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const LoginScreen()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: PRIMARY_COLOR,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/img/logo/logo.png',
              width: MediaQuery.of(context).size.width / 2,
            ),
            const SizedBox(
              height: 16,
            ),
            const CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
