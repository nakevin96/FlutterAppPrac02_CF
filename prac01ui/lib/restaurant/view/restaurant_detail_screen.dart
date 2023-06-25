import 'package:flutter/material.dart';
import 'package:prac01ui/common/layout/defalut_layout.dart';
import 'package:prac01ui/restaurant/component/restaurant_card.dart';

class RestaurantDetailScreen extends StatelessWidget {
  const RestaurantDetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '이세계 아이돌',
      child: Column(
        children: [
          RestaurantCard(
            restaurantImage: Image.asset('asset/img/food/ddeok_bok_gi.jpg'),
            name: '이세돌 최고',
            tags: const ['아이네', '징버거', '릴파'],
            ratingsCount: 50000,
            deliveryTime: 0,
            deliveryFee: 0,
            ratings: 5.0,
            isDetail: true,
            detail: '주르르, 고세구, 비챤',
          ),
        ],
      ),
    );
  }
}
