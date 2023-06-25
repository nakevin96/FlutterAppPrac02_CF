import 'package:prac01ui/common/const/data.dart';

enum RestaurantPriceRange {
  expensive,
  medium,
  cheap,
}

// 데이터를 가져왔을 때 무조건 class의 instance로 바꿔야
// 자동완성과 같은 도움을 받을 수 있습니다.
class RestaurantModel {
  final String id;
  final String name;
  final String thumbUrl;
  final List<String> tags;

  final RestaurantPriceRange priceRange;
  final double ratings;
  final int ratingsCount;
  final int deliveryTime;
  final int deliveryFee;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.thumbUrl,
    required this.tags,
    required this.priceRange,
    required this.ratings,
    required this.ratingsCount,
    required this.deliveryTime,
    required this.deliveryFee,
  });

  factory RestaurantModel.fromJson({
    // json의 타입은 무조건 Map<String, dynamic>
    required Map<String, dynamic> json,
  }) {
    return RestaurantModel(
      id: json['id'],
      name: json['name'],
      thumbUrl: 'http://$ip${json['thumbUrl']}',
      tags: List<String>.from(json['tags']),
      // values를 하고 firstWhere를 하면 enum의 모든 값을 순회하며
      // 동일한 값을 찾는다.
      priceRange: RestaurantPriceRange.values.firstWhere(
        (element) => element.name == json['priceRange'],
      ),
      ratings: json['ratings'],
      ratingsCount: json['ratingsCount'],
      deliveryTime: json['deliveryTime'],
      deliveryFee: json['deliveryFee'],
    );
  }
}
