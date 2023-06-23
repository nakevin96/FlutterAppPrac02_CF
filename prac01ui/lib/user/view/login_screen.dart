import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:prac01ui/common/component/custom_text_form.dart';
import 'package:prac01ui/common/const/colors.dart';
import 'package:prac01ui/common/layout/defalut_layout.dart';
import 'package:prac01ui/common/view/root_tab.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    // Dio는 서버와 통신을 하기 위한 flutter 패키지
    final dio = Dio();

    //local host
    const emulatorIp = '10.0.2.2:3000';
    const simulatorIp = '127.0.0.1:3000';

    final ip = Platform.isIOS ? simulatorIp : emulatorIp;

    return DefaultLayout(
      child: SingleChildScrollView(
        // [UI/UX] keyboardDismissBehavior에 onDrag속성을 넣으면, 화면 드래그 시 키보드가 내려갑니다.
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          // SafeArea를 사용하면 핸드폰 구조에서 상단 네비게이션 바나 노치를 피해서 랜더링 됨
          top: true,
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const _Title(),
                const SizedBox(
                  height: 16.0,
                ),
                const _SubTitle(),
                // Image.asset을 쓰면 asset파일로 부터 이미지를 가져올 수 있음
                Image.asset(
                  'asset/img/misc/logo.png',
                  // MediaQuery.of(context).size.width를 쓰면 화면의 넓이를 받아올 수 있음
                  width: (MediaQuery.of(context).size.width) * 2 / 3,
                ),
                CustomTextForm(
                  customHintText: '이메일을 입력해주세요',
                  onChanged: (value) {
                    // textform 내부에서 변화가 발생할 때 마다 value값이 변하고 onChanged호출
                    username = value;
                  },
                ),
                const SizedBox(
                  height: 16.0,
                ),
                CustomTextForm(
                  customHintText: '비밀번호를 입력해주세요',
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                ),
                const SizedBox(
                  height: 16.0,
                ),
                // ElevatedButton은 버튼을 눌렀을 때 올라오는 듯한 3D효과가 탑재되어 있음
                // 버튼의 배경색이 강조됨
                ElevatedButton(
                  onPressed: () async {
                    // test@codefactory.ai:testtest
                    final rawString = '$username:$password';

                    // dart에서 base64로 인코딩 하는 방법
                    Codec<String, String> stringToBase64 = utf8.fuse(base64);
                    String token = stringToBase64.encode(rawString);

                    final response = await dio.post(
                      'http://$ip/auth/login',
                      options: Options(
                        headers: {
                          'authorization': 'Basic $token',
                        },
                      ),
                    );

                    // response의 body를 확인하고자 할 때 사용
                    //print(response.data);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const RootTab(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PRIMARY_COLOR,
                  ),
                  child: const Text(
                    '로그인',
                  ),
                ),
                // TextButton은 버튼의 배경이 투명하고 텍스트만 평면버튼으로
                // 주로 보조적인 액션이나 링크로 사용
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: PRIMARY_COLOR,
                  ),
                  child: const Text(
                    '회원가입',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return const Text('환영합니다!',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ));
  }
}

class _SubTitle extends StatelessWidget {
  const _SubTitle();

  @override
  Widget build(BuildContext context) {
    return const Text(
      '이메일과 비밀번호를 입력하여 로그인 해주세요!\n오늘도 성공적인 주문이 되길!',
      style: TextStyle(
        fontSize: 16,
        color: BODY_TEXT_COLOR,
      ),
    );
  }
}
