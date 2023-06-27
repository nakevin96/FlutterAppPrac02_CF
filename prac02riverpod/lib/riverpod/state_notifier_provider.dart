import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prac02riverpod/model/shopping_item_model.dart';

final shoppingListProvider =
    StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>(
  (ref) => ShoppingListNotifier(),
);

// state_notifier_provider는 다른 것들과 달리 class로 만들어야 합니다.
// 그리고 무조건 StateNotifier를 상속해야 합니다.
// 또한 어떤 타입을 관리하는지도 무조건 넣어야 합니다.
class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {
  // StateNotifier를 상속받는 클래스는 꼭 생성자를 선언해야 하며
  // super안에 초기값을 넣어줍니다.
  ShoppingListNotifier()
      : super(
          [
            ShoppingItemModel(
              name: '김치',
              quantity: 3,
              hasBought: false,
              isSpicy: true,
            ),
            ShoppingItemModel(
              name: '신라면',
              quantity: 5,
              hasBought: false,
              isSpicy: true,
            ),
            ShoppingItemModel(
              name: '삼겹살',
              quantity: 10,
              hasBought: false,
              isSpicy: false,
            ),
            ShoppingItemModel(
              name: '수박',
              quantity: 2,
              hasBought: false,
              isSpicy: false,
            ),
            ShoppingItemModel(
              name: '카테고리',
              quantity: 7,
              hasBought: false,
              isSpicy: false,
            ),
          ],
        );

  void toggleHasBought({
    required String name,
  }) {
    // 상태를 다루는 것이기에 state를 불러옵니다.
    // state는 상속한 StateNotifier에서 제공해줍니다.
    state = state
        .map(
          (e) => e.name == name
              ? ShoppingItemModel(
                  name: e.name,
                  quantity: e.quantity,
                  hasBought: !e.hasBought,
                  isSpicy: e.isSpicy,
                )
              : e,
        )
        .toList();
  }
}
