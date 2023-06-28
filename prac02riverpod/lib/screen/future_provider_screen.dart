import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prac02riverpod/layout/default_layout.dart';
import 'package:prac02riverpod/riverpod/future_provider.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue state = ref.watch(multiplesFutureProvider);

    return DefaultLayout(
      title: 'FutureProviderScreen',
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AsyncValue에는 when이라는 함수 존재. 분기 처리 가능
            // data는 로딩이 끝나서 데이터가 있을 때
            // error는 에러가 발생했을 때
            // loading은 로딩 중일 때 실행할 함수
            state.when(data: (data) {
              return Text(
                data.toString(),
                textAlign: TextAlign.center,
              );
            }, error: (err, stack) {
              return const Icon(
                Icons.error_outline,
              );
            }, loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
          ],
        ),
      ),
    );
  }
}
