import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prac02riverpod/layout/default_layout.dart';
import 'package:prac02riverpod/model/shopping_item_model.dart';
import 'package:prac02riverpod/riverpod/state_notifier_provider.dart';

class StateNotifierProviderScreen extends ConsumerWidget {
  const StateNotifierProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ShoppingItemModel> state = ref.watch(shoppingListProvider);
    return DefaultLayout(
      title: 'StateNotifierProviderScreen',
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
