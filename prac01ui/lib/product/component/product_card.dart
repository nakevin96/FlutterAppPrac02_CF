import 'package:flutter/material.dart';
import 'package:prac01ui/common/const/colors.dart';
import 'package:prac01ui/restaurant/model/restaurant_detail_model.dart';

class ProductCard extends StatelessWidget {
  final Image image;
  final String name;
  final String detail;
  final int price;

  const ProductCard({
    super.key,
    required this.image,
    required this.name,
    required this.detail,
    required this.price,
  });

  factory ProductCard.fromModel({
    required RestaurantProductModel model,
  }) {
    return ProductCard(
      image: Image.network(
        model.imgUrl,
        width: 110,
        height: 110,
        fit: BoxFit.cover,
      ),
      name: model.name,
      detail: model.detail,
      price: model.price,
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      // IntrinsicHeight를 하면 Row 안에 들어가는 children들의 각 높이중 가장 큰거에 맞춰짐
      // 즉 모든 자식 높이가 가장 큰 걸로 맞춰진다는 의미입니다.
      child: Row(
        // Row 안에 들어가는 children들은 각각의 고유의 높이를 갖게됨
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              8.0,
            ),
            child: image,
            // Image.asset(
            //   'asset/img/food/ddeok_bok_gi.jpg',
            //   width: 110,
            //   height: 110,
            //   fit: BoxFit.cover,
            // ),
          ),
          const SizedBox(
            width: 16.0,
          ),
          Expanded(
            // Expanded는 Row, Column, Flex의 자식으로 사용이 가능하며
            // 부모의 남은 부분을 전부 채우는 방식으로 동작
            // Row, Column에서 핸드폰 화면에 맞게 균일하게 배치하기 위해 사용합니다.
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  detail,
                  // Text의 overflow는 글자가 화면 밖으로 나갔을 때 처리하는 방식을 의미합니다.
                  // clip: 그냥 자름
                  // fade: 흐릿해짐
                  // visible: 그냥 보여줌
                  // ellipsis: ...으로 남은 부분 생략
                  overflow: TextOverflow.ellipsis,
                  // 만약 텍스트가 일정 줄 이상 넘어가면 안된다면 maxLines를 설정해줘야 한다.
                  maxLines: 2,
                  style: const TextStyle(
                    color: BODY_TEXT_COLOR,
                    fontSize: 14.0,
                  ),
                ),
                Text(
                  '₩$price',
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: PRIMARY_COLOR,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
