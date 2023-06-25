import 'package:json_annotation/json_annotation.dart';
import 'package:prac01ui/common/const/data.dart';

// flutter pub run build_runner build 를 입력하면 코드 생성
// 아래처럼 .g파일 대상으로 수행
// 만약 flutter pub run bulid_runner watch라고 하면 저장할 때마다 변한 부분 추적해서 빌드
part 'restaurant_model.g.dart';

enum RestaurantPriceRange {
  expensive,
  medium,
  cheap,
}

// 데이터를 가져왔을 때 무조건 class의 instance로 바꿔야
// 자동완성과 같은 도움을 받을 수 있습니다.

@JsonSerializable()
class RestaurantModel {
  // 문제: json_serializable을 설치하기 전에는 속성들을 다 지정하고 있으며, API 요청과 속성 이름이 동일합니다.
  // fromJson에서 또 반복적으로 속성들을 입력해주어야 합니다.
  // 이걸 자동화 하기 위해서 json_serializable을 사용합니다.

  final String id;
  final String name;
  // json_serializable은 원 파일에 의해 생성되기 때문에 절대 수정을 하면 안됩니다.
  // 무언가 결과 파일에 수정하고자 하는게 있다면 JsonKey annotation을 사용하셔야 합니다.
  // fromJson과 toJson속성이 존재하는데 각각 fromJson함수와 toJson함수를 호출할 때 사용할
  // static 함수를 넣어주면 됩니다.
  @JsonKey(
    fromJson: pathToUrl,
  )
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

  // // json_serializable 사용하기 전 작성 코드
  // factory RestaurantModel.fromJson({
  //   // json의 타입은 무조건 Map<String, dynamic>
  //   required Map<String, dynamic> json,
  // }) {
  //   return RestaurantModel(
  //     id: json['id'],
  //     name: json['name'],
  //     thumbUrl: 'http://$ip${json['thumbUrl']}',
  //     tags: List<String>.from(json['tags']),
  //     // values를 하고 firstWhere를 하면 enum의 모든 값을 순회하며
  //     // 동일한 값을 찾는다.
  //     priceRange: RestaurantPriceRange.values.firstWhere(
  //       (element) => element.name == json['priceRange'],
  //     ),
  //     ratings: json['ratings'],
  //     ratingsCount: json['ratingsCount'],
  //     deliveryTime: json['deliveryTime'],
  //     deliveryFee: json['deliveryFee'],
  //   );
  // }

  // json_serializable 사용 후 코드
  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelFromJson(json);

  // json_serializable 적용후 나온 toJson의 용도
  Map<String, dynamic> toJson() => _$RestaurantModelToJson(this);

  // jsonKey annoation에 넣어줄 함수는 무조건 static이어야 합니다.
  static pathToUrl(String value) {
    return 'http://$ip$value';
  }
}
