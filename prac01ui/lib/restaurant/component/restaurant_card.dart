import 'package:flutter/material.dart';
import 'package:prac01ui/common/const/colors.dart';

class RestaurantCard extends StatelessWidget {
  final Widget restaurantImage;
  final String restaurantName;
  final List<String> restaurantTags;
  final int ratingCount;
  final int deliveryTime;
  final int deliveryFee;
  final double averageRating;

  const RestaurantCard({
    super.key,
    required this.restaurantImage,
    required this.restaurantName,
    required this.restaurantTags,
    required this.ratingCount,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.averageRating,
  });

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
        ClipRRect(
          // ClipRRect 위젯을 쓰면 내부 child를 깎아서 가공이 가능합니다.
          borderRadius: BorderRadius.circular(12.0),
          child: restaurantImage,
        ),
        const SizedBox(
          height: 16.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              restaurantName,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              restaurantTags.join(' ・ '),
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
                  label: averageRating.toString(),
                ),
                renderDot(),
                _IconText(
                  icon: Icons.receipt,
                  label: ratingCount.toString(),
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
          ],
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