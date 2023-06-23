import 'package:flutter/material.dart';
// 모든 페이지에 일괄적으로 공통적으로 적용하고 싶을 때 view를 layout으로
// 감싸주면 좋습니다.

// 나중에 모든 view에 특정 기능, (initstate후 api요청) 을 넣고 싶을 때
// default_layout에 넣고 view를 감싸면 됩니다.

class DefaultLayout extends StatelessWidget {
  final Widget child;

  const DefaultLayout({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: child,
    );
  }
}
