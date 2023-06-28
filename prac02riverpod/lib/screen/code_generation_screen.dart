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

    return DefaultLayout(
      title: 'CodeGenerationScreen',
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(state1),
            Text(state2.toString()),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
              ),
            ),
            IconButton(
              onPressed: () {},
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
