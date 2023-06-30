import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prac01ui/common/model/cursor_pagination_model.dart';
import 'package:prac01ui/restaurant/repository/restaurant_repository.dart';

final restaurantProvider =
    StateNotifierProvider<RestaurantStateNotifier, CursorPaginationBase>(
  (ref) {
    final repository = ref.watch(restaurantRepositoryProvider);
    final notifier = RestaurantStateNotifier(repository: repository);
    return notifier;
  },
);

class RestaurantStateNotifier extends StateNotifier<CursorPaginationBase> {
  final RestaurantRepository repository;
  RestaurantStateNotifier({
    required this.repository,
  }) : super(CursorPaginationLoading()) {
    pagenate();
  }

  pagenate() async {
    final resp = await repository.paginate();

    state = resp;
  }
}
