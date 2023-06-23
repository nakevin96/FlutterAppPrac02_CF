import 'package:flutter/material.dart';
import 'package:prac01ui/common/component/custom_text_form.dart';
import 'package:prac01ui/common/layout/defalut_layout.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextForm(
            customHintText: '이메일을 입력해주세요',
            onChanged: (value) {},
          ),
          CustomTextForm(
            customHintText: '비밀번호를 입력해주세요',
            obscureText: true,
            onChanged: (value) {},
          )
        ],
      ),
    );
  }
}
