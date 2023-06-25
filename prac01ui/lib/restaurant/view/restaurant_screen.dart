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
                  final pItem = RestaurantModel.fromJson(
                    json: item,
                  );
                  return RestaurantCard.fromRestaurantModel(
                    restaurantModel: pItem,
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
