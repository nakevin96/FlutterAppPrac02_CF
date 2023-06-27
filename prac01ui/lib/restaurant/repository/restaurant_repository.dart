import 'package:dio/dio.dart' hide Headers;
import 'package:prac01ui/common/model/cursor_pagination_model.dart';
import 'package:prac01ui/restaurant/model/restaurant_detail_model.dart';
import 'package:prac01ui/restaurant/model/restaurant_model.dart';
import 'package:retrofit/retrofit.dart';

part 'restaurant_repository.g.dart';

// retrofit을 사용하기 위한 annotation
@RestApi()
abstract class RestaurantRepository {
  // 여러 레포지토리에서 같은 dio를 공유해야 하는 이유가 존재합니다.

  // baseurl = http://$ip/restaurant
  factory RestaurantRepository(Dio dio, {String baseUrl}) =
      _RestaurantRepository;

  // http://$ip/restaurant/
  @GET('/')
  @Headers({
    'accessToken': 'true',
  })
  Future<CursorPagination<RestaurantModel>> paginate();

  // retrofit에서는 :id가 아니라 {id}로 변수를 사용합니다.
  // http://$ip/restaurant/:id
  // retrofit에서 가장 중요한 것은
  // 실제로 응답을 받는 형태와 완전히 똑같은 클래스를 만들어서 넣어줘야 합니다.
  @GET('/{id}')
  @Headers({
    'accessToken': 'true',
  })
  Future<RestaurantDetailModel> getRestaurantDetail({
    // id라고 하는 path안에 들어가야 하는 변수를 파라미터로 대체해줍니다.
    @Path('id') required String restaurantId,
  });
}
