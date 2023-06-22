import 'package:flutter/material.dart';
import 'package:prac01ui/common/component/custom_text_form.dart';

void main() {
  runApp(
    const _App(),
  );
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
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
      ),
    );
  }
}
