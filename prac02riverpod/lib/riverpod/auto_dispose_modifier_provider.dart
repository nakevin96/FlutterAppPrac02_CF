import 'package:flutter_riverpod/flutter_riverpod.dart';

// autoDispose의 경우 새로운 값을 받지는 않습니다.
final autoDisposeModifierProvider =
    FutureProvider.autoDispose<List<int>>((ref) async {
  // autoDispose라는 키워드를 추가를 하게 되면
  // 매번 새로운 값을 가져옵니다.
  // 즉 캐시를 하지 않고 사용하지 않을 때는 삭제를 해두었다가,
  // 다시 사용할 때 새롭게 불러옵니다.
  await Future.delayed(const Duration(seconds: 1));

  return [1, 2, 3, 4, 5, 6, 7];
});
