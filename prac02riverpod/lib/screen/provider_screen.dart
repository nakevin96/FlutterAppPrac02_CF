import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prac02riverpod/layout/default_layout.dart';
import 'package:prac02riverpod/riverpod/provider.dart';
import 'package:prac02riverpod/riverpod/state_notifier_provider.dart';

class ProviderScreen extends ConsumerWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // filteredShoppingListProvider안에 stateNotifierProvider를 넣어두었기네 watch가 가능해집니다.
    // 더 재미있는 건 여기서 상태를 바꾸고 state_notifier_screen으로 가보시면 반영도 되어있습니다.
    final state = ref.watch(filteredShoppingListProvider);
    return DefaultLayout(
      title: 'ProviderScreen',
      actions: [
        PopupMenuButton<FilterState>(
          onSelected: (value) {
            ref.read(filterProvider.notifier).update((state) => value);
          },
          itemBuilder: (_) => FilterState.values
              .map(
                (e) => PopupMenuItem(
                  value: e,
                  child: Text(e.name),
                ),
              )
              .toList(),
        ),
      ],
      body: ListView(
        children: state
            .map(
              (e) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  children: [
                    Text('상품명: ${e.name}'),
                    Text('남은 수량: ${e.quantity}'),
                    Text('구매 여부: ${e.hasBought ? 'Yes' : 'No'}'),
                    IconButton(
                      onPressed: () {
                        ref
                            .read(shoppingListProvider.notifier)
                            .toggleHasBought(name: e.name);
                      },
                      icon: e.hasBought
                          ? const Icon(Icons.bookmark_remove_outlined)
                          : const Icon(Icons.bookmark_outlined),
                    )
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
