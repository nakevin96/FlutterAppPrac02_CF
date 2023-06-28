// async 요청 가정 Future.delay

import 'package:flutter_riverpod/flutter_riverpod.dart';

final multiplesFutureProvider = FutureProvider<List<int>>((ref) async {
  await Future.delayed(
    const Duration(
      milliseconds: 1600,
    ),
  );

  return [1, 2, 3, 4, 5, 6, 7];
});
