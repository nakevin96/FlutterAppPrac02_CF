import 'package:flutter_riverpod/flutter_riverpod.dart';

// autoDispose의 경우 새로운 값을 받지는 않습니다.
final autoDisposeModifierProvider =
    FutureProvider.autoDispose<List<int>>((ref) async {
  await Future.delayed(const Duration(seconds: 1));

  return [1, 2, 3, 4, 5, 6, 7];
});
