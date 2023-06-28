// family modifer는 어떤 provider든 다 적용이 가능합니다.
import 'package:flutter_riverpod/flutter_riverpod.dart';

// provider에서 '.'을 붙인 후 family를 적용하면
// 두번째 파라미터를 타입과 함께 넣어주어야 합니다.
final familyModifierProvider =
    FutureProvider.family<List<int>, int>((ref, data) async {
  await Future.delayed(const Duration(seconds: 2));

  return List.generate(5, (index) => index * data);
});
