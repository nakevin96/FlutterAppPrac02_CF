import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prac02riverpod/layout/default_layout.dart';
import 'package:prac02riverpod/riverpod/state_provider_screen.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    // 아래 세 가지가 가장 중요한 함수입니다.
    // final provider = ref.read(provider);
    // final provider = ref.listen(provider, (previous, next) {});
    // final provider = ref.watch(provider);

    // riverpod watch
    final provider = ref.watch(numberProvider);

    return DefaultLayout(
      title: 'StateProviderScreen',
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              provider.toString(),
            ),
            IconButton(
              onPressed: () {
                ref.read(numberProvider.notifier).update((state) => state + 1);
              },
              icon: const Icon(
                Icons.add_outlined,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const _NextScreen(),
                ));
              },
              icon: const Icon(
                Icons.navigate_next_outlined,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NextScreen extends ConsumerWidget {
  const _NextScreen();

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final provider = ref.watch(numberProvider);
    return DefaultLayout(
      title: 'StateProviderNextScreen',
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              provider.toString(),
            ),
            IconButton(
              onPressed: () {
                ref.read(numberProvider.notifier).update((state) => state + 1);
              },
              icon: const Icon(
                Icons.add_outlined,
              ),
            )
          ],
        ),
      ),
    );
  }
}
