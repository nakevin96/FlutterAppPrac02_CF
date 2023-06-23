import 'package:flutter/material.dart';
import 'package:prac01ui/user/view/login_screen.dart';

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
      theme: ThemeData(
        // pubspec.yaml에 추가한 font 더하기
        fontFamily: 'NotoSans',
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
