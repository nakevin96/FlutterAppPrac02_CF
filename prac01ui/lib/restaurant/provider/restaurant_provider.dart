import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prac01ui/restaurant/model/restaurant_model.dart';
import 'package:prac01ui/restaurant/repository/restaurant_repository.dart';

final restaurantProvider =
    StateNotifierProvider<RestaurantStateNotifier, List<RestaurantModel>>(
  (ref) {
    final repository = ref.watch(restaurantRepositoryProvider);
    final notifier = RestaurantStateNotifier(repository: repository);
    return notifier;
  },
);

class RestaurantStateNotifier extends StateNotifier<List<RestaurantModel>> {
  final RestaurantRepository repository;
  RestaurantStateNotifier({
    required this.repository,
  }) : super([]) {
    pagenate();
  }

  pagenate() async {
    final resp = await repository.paginate();

    state = resp.data;
  }
}
