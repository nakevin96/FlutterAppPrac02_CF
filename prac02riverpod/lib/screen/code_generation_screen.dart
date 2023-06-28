import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prac02riverpod/layout/default_layout.dart';
import 'package:prac02riverpod/riverpod/code_generation_provider.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state1 = ref.watch(gStringStateProvider);
    final state2 = ref.watch(gIntStateProvider);
    final state3 = ref.watch(gIntFutureStateProvider);
    final state4 = ref.watch(gIntFutureState2Provider);
    final state5 = ref.watch(gFamilyStateMultiflyProvider(
      number1: 4,
      number2: 4,
    ));
    final state6 = ref.watch(gStateNotifierProvider);

    return DefaultLayout(
      title: 'CodeGenerationScreen',
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(state1),
            Text(state2.toString()),
            state3.when(
              data: (data) => Text(data.toString()),
              error: (err, stack) => Text(err.toString()),
              loading: () => const CircularProgressIndicator(),
            ),
            state4.when(
              data: (data) => Text(data.toString()),
              error: (err, stack) => Text(err.toString()),
              loading: () => const CircularProgressIndicator(),
            ),
            Text(state5.toString()),
            Text(state6.toString()),
            IconButton(
              onPressed: () {
                ref.read(gStateNotifierProvider.notifier).increment();
              },
              icon: const Icon(
                Icons.add,
              ),
            ),
            IconButton(
              onPressed: () {
                ref.read(gStateNotifierProvider.notifier).decrement();
              },
              icon: const Icon(
                Icons.remove,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
