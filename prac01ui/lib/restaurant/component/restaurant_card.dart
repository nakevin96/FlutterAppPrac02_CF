import 'package:flutter/material.dart';
import 'package:prac01ui/common/const/colors.dart';
import 'package:prac01ui/restaurant/model/restaurant_detail_model.dart';
import 'package:prac01ui/restaurant/model/restaurant_model.dart';

class RestaurantCard extends StatelessWidget {
  final Widget restaurantImage;
  final String name;
  final List<String> tags;
  final int ratingsCount;
  final int deliveryTime;
  final int deliveryFee;
  final double ratings;

  // detail
  final bool isDetail;
  final String? detail;

  const RestaurantCard({
    super.key,
    required this.restaurantImage,
    required this.name,
    required this.tags,
    required this.ratingsCount,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.ratings,
    this.isDetail = false,
    this.detail,
  });

  factory RestaurantCard.fromRestaurantModel({
    required RestaurantModel restaurantModel,
    bool isDetail = false,
    String? detail,
  }) {
    return RestaurantCard(
      restaurantImage: Image.network(
        restaurantModel.thumbUrl,
        fit: BoxFit.cover,
      ),
      name: restaurantModel.name,
      tags: restaurantModel.tags,
      ratingsCount: restaurantModel.ratingsCount,
      deliveryTime: restaurantModel.deliveryTime,
      deliveryFee: restaurantModel.deliveryFee,
      ratings: restaurantModel.ratings,
      isDetail: isDetail,
      detail: restaurantModel is RestaurantDetailModel
          ? restaurantModel.detail
          : null,
    );
  }

  renderDot() {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 4.0,
      ),
      child: Text(
        '・',
        style: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 위젯 안에서 사용하면 바로 아래 부분에만 적용
        if (isDetail) restaurantImage,
        if (!isDetail)
          ClipRRect(
            // ClipRRect 위젯을 쓰면 내부 child를 깎아서 가공이 가능합니다.
            borderRadius: BorderRadius.circular(12.0),
            child: restaurantImage,
          ),
        const SizedBox(
          height: 16.0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isDetail ? 16.0 : 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                tags.join(' ・ '),
                style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w300,
                  color: BODY_TEXT_COLOR,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  _IconText(
                    icon: Icons.star,
                    label: ratings.toString(),
                  ),
                  renderDot(),
                  _IconText(
                    icon: Icons.receipt,
                    label: ratingsCount.toString(),
                  ),
                  renderDot(),
                  _IconText(
                    icon: Icons.timelapse_outlined,
                    label: '$deliveryTime 분',
                  ),
                  renderDot(),
                  _IconText(
                    icon: Icons.monetization_on,
                    label: deliveryFee == 0 ? '무료' : '$deliveryFee원',
                  ),
                ],
              ),
              if (detail != null && isDetail)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: Text(detail!),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _IconText extends StatelessWidget {
  final IconData icon;
  final String label;

  const _IconText({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: PRIMARY_COLOR,
          size: 14.0,
        ),
        const SizedBox(
          width: 8.0,
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
