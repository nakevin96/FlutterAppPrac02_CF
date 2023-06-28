import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prac02riverpod/layout/default_layout.dart';
import 'package:prac02riverpod/riverpod/family_modifier_provider.dart';

class FamilyModifierScreen extends ConsumerWidget {
  const FamilyModifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // familyProvider는 생성을 해주어야 합니다. 입력받을 데이터를 추가해주었기 때문입니다.
    final state = ref.watch(familyModifierProvider(4));

    return DefaultLayout(
      title: 'FamilyModiferScreen',
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            state.when(
              data: (data) => Text(
                data.toString(),
              ),
              error: (err, stack) => Text(
                err.toString(),
              ),
              loading: () => const CircularProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}
