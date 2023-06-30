import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prac01ui/restaurant/component/restaurant_card.dart';
import 'package:prac01ui/restaurant/provider/restaurant_provider.dart';
import 'package:prac01ui/restaurant/view/restaurant_detail_screen.dart';

class RestaurantScreen extends ConsumerWidget {
  const RestaurantScreen({super.key});

  // Future<List<RestaurantModel>> paginateRestaurant(WidgetRef ref) async {
  //   // final dio = Dio();
  //   // dio.interceptors.add(
  //   //   CustomInterceptor(storage: storage),
  //   // );
  //   final dio = ref.watch(dioProvider);

  //   final resp =
  //       await RestaurantRepository(dio, baseUrl: 'http://$ip/restaurant')
  //           .paginate();

  //   return resp.data;

  //   // // retrofit 적용 전
  //   // final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

  //   // final resp = await dio.get(
  //   //   'http://$ip/restaurant',
  //   //   options: Options(
  //   //     headers: {
  //   //       'authorization': 'Bearer $accessToken',
  //   //     },
  //   //   ),
  //   // );

  //   // return resp.data['data'];
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(restaurantProvider);

    if (data.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.separated(
        separatorBuilder: (_, index) {
          return const SizedBox(
            height: 16.0,
          );
        },
        itemCount: data.length,
        itemBuilder: (_, index) {
          // itemBuilder가 실행될 때마다 item에 하나씩 담김
          // final item = snapshot.data![index];

          // parsed item
          // final pItem = RestaurantModel.fromJson(
          //   item,
          // );
          return GestureDetector(
            // GestureDetector를 사용하면 특정 gesture를 인식해 동작을 정의할 수 있음
            onTap: () {
              // Navigator.push를 통해 화면 전환이 가능
              // Navigator는 모든 앱 페이지를 스택 구조로 만들어 Route 객체를 관리하는 기능
              // context는 위치 정보를 쌓아 올리기 위해 사용
              Navigator.of(context).push(
                // Router란 앱에서 보이는 하나의 페이지나 화면을 의미
                MaterialPageRoute(
                  // Flutter에서 _는 매개변수로 할 필요가 없거나 사용하지 않는다는 의미
                  builder: (_) => RestaurantDetailScreen(
                    id: data[index].id,
                    // id: pItem.id,
                  ),
                ),
              );
            },
            child: RestaurantCard.fromRestaurantModel(
              restaurantModel: data[index],
              // restaurantModel: pItem,
            ),
          );
        },
      ),
    );
  }
}
