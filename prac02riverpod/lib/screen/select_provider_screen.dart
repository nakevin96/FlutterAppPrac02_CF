import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prac02riverpod/layout/default_layout.dart';
import 'package:prac02riverpod/riverpod/select_provider.dart';

class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // provider의 select함수에서 value는 provider의 state입니다.
    // 여기서는 ShoppingItemModel이 들어있겠죠.
    // 이렇게 하면 딱 isSpicy만 watch합니다.
    // 즉 아래에서 hasBought를 아무리 변경해도 이 widget은 build되지 않는 것이죠.
    // 이런 이유로 select는 최적화와 연관이 되어 있는 겁니다.
    final state = ref.watch(selectProvider.select((value) => value.isSpicy));
    print('build');

    ref.listen(
        selectProvider.select(
          (value) => value.hasBought,
        ), (previous, next) {
      print('next : $next');
    });
    return DefaultLayout(
      title: 'SelectProviderScreen',
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(
            //   state.name,
            // ),
            // Text(
            //   '맵기: ${state.isSpicy.toString()}',
            // ),
            // Text(
            //   '구매 여부: ${state.hasBought.toString()}',
            // ),
            Text(
              '맵기: ${state.toString()}',
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(selectProvider.notifier).toggleIsSpicy();
              },
              child: const Text(
                'Spicy toggle',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(selectProvider.notifier).toggleHasBought();
              },
              child: const Text(
                'hasBought toggle',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
