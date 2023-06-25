import 'package:flutter/material.dart';
import 'package:prac01ui/common/const/colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

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
            child: Image.asset(
              'asset/img/food/ddeok_bok_gi.jpg',
              width: 110,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
          const Expanded(
            // Expanded는 Row, Column, Flex의 자식으로 사용이 가능하며
            // 부모의 남은 부분을 전부 채우는 방식으로 동작
            // Row, Column에서 핸드폰 화면에 맞게 균일하게 배치하기 위해 사용합니다.
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '떡볶이',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '전통 떡볶이의 정석!\n존맛탱!!',
                  // Text의 overflow는 글자가 화면 밖으로 나갔을 때 처리하는 방식을 의미합니다.
                  // clip: 그냥 자름
                  // fade: 흐릿해짐
                  // visible: 그냥 보여줌
                  // ellipsis: ...으로 남은 부분 생략
                  overflow: TextOverflow.ellipsis,
                  // 만약 텍스트가 일정 줄 이상 넘어가면 안된다면 maxLines를 설정해줘야 한다.
                  maxLines: 2,
                  style: TextStyle(
                    color: BODY_TEXT_COLOR,
                    fontSize: 14.0,
                  ),
                ),
                Text(
                  '₩10000',
                  textAlign: TextAlign.right,
                  style: TextStyle(
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
