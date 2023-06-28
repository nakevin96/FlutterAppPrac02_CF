import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prac02riverpod/model/shopping_item_model.dart';

final selectProvider = StateNotifierProvider<SelectNotifier, ShoppingItemModel>(
    (ref) => SelectNotifier());

class SelectNotifier extends StateNotifier<ShoppingItemModel> {
  SelectNotifier()
      : super(
          ShoppingItemModel(
            name: '김치',
            quantity: 3,
            hasBought: false,
            isSpicy: true,
          ),
        );

  // 한 요소만 반환하기 위해서 전체 ShoppingItemModel을 선언해주어야 합니다.
  // 귀찮죠?
  // ShoppingItemModel 자체에 요소들이 final로 선언되어 있기에 어쩔 수 없습니다.
  // 그렇다고 final을 빼기에는 immutable하지 않아지기 때문에 의도하지 않은 버그가 양산될 수 있습니다.

  // final ts = TextStyle(
  //     fontSize: 20,
  //     fontWeight: FontWeight.w500,
  //   );

  // TextStyle을 떠올려보면
  // 아래와 같이 다른 스타일은 그대로 둔 채 스타일을 만들어 낼 수 있었습니다.
  // final ts2 = ts.copyWith(
  //   fontSize: 18.0,
  // );

  // shopping_item_model.dart로 가서 copyWith함수를 만들어봅시다.
  toggleHasBought() {
    state = ShoppingItemModel(
      name: state.name,
      quantity: state.quantity,
      hasBought: !state.hasBought,
      isSpicy: state.isSpicy,
    );
  }

  // shopping_item_model에 copyWith을 선언하면 아래와 같이 간단하게 선언이 가능합니다.
  toggleIsSpicy() {
    state = state.copyWith(isSpicy: !state.isSpicy);
  }
}
