import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:prac01ui/common/const/data.dart';
import 'package:prac01ui/restaurant/component/restaurant_card.dart';
import 'package:prac01ui/restaurant/model/restaurant_model.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  Future<List> paginateRestaurant() async {
    final dio = Dio();
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    final resp = await dio.get(
      'http://$ip/restaurant',
      options: Options(
        headers: {
          'authorization': 'Bearer $accessToken',
        },
      ),
    );

    return resp.data['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: FutureBuilder<List>(
            future: paginateRestaurant(),
            builder: (context, AsyncSnapshot<List> snapshot) {
              if (!snapshot.hasData) {
                return Container();
              }

              return ListView.separated(
                separatorBuilder: (_, index) {
                  return const SizedBox(
                    height: 16.0,
                  );
                },
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) {
                  // itemBuilder가 실행될 때마다 item에 하나씩 담김
                  final item = snapshot.data![index];

                  // parsed item
                  final pItem = RestaurantModel(
                    id: item['id'],
                    name: item['name'],
                    thumbUrl: item['thumbUrl'],
                    tags: List<String>.from(item['tags']),
                    // values를 하고 firstWhere를 하면 enum의 모든 값을 순회하며
                    // 동일한 값을 찾는다.
                    priceRange: RestaurantPriceRange.values.firstWhere(
                      (element) => element.name == item['priceRange'],
                    ),
                    ratings: item['ratings'],
                    ratingsCount: item['ratingsCount'],
                    deliveryTime: item['deliveryTime'],
                    deliveryFee: item['deliveryFee'],
                  );
                  return RestaurantCard(
                    restaurantImage: Image.network(
                      'http://$ip${pItem.thumbUrl}',
                      fit: BoxFit.cover,
                    ),
                    name: pItem.name,
                    // Future로 받아오게 되면 타입이 dynamic인 상황이 있는데
                    // 우리는 해당 타입이 String인 것을 알기 때문에 타입.from으로 바꿔주면 됩니다.
                    tags: pItem.tags,
                    ratingsCount: pItem.ratingsCount,
                    deliveryTime: pItem.deliveryTime,
                    deliveryFee: pItem.deliveryFee,
                    ratings: pItem.ratings,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
