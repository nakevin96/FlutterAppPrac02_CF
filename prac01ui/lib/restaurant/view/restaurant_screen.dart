import 'package:flutter/material.dart';
import 'package:prac01ui/restaurant/component/restaurant_card.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: RestaurantCard(
            restaurantImage: Image.asset(
              'asset/img/food/ddeok_bok_gi.jpg',
              // BoxFit.cover를 하면 화면 전체를 차지하게 할 수 있습니다.
              fit: BoxFit.cover,
            ),
            restaurantName: '불타는 떡볶이',
            restaurantTags: const [
              '떡볶이',
              '치즈',
              '매운맛',
            ],
            ratingCount: 100,
            deliveryTime: 15,
            deliveryFee: 2000,
            averageRating: 4.52,
          ),
        ),
      ),
    );
  }
}
