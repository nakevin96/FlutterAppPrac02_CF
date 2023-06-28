import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prac02riverpod/riverpod/provider_observer.dart';
import 'package:prac02riverpod/screen/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      // observers를 쓰면 provider들을 관찰 할 수 있습니다.
      observers: [
        Logger(),
      ],
      // ProviderScope는 Riverpod에서 provider를 사용하기 위해 추가합니다.
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
