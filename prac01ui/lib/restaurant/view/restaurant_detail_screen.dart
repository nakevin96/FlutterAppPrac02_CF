import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:prac01ui/common/const/data.dart';
import 'package:prac01ui/common/layout/defalut_layout.dart';
import 'package:prac01ui/product/component/product_card.dart';
import 'package:prac01ui/restaurant/component/restaurant_card.dart';
import 'package:prac01ui/restaurant/model/restaurant_detail_model.dart';
import 'package:prac01ui/restaurant/repository/restaurant_repository.dart';

class RestaurantDetailScreen extends StatelessWidget {
  final String id;

  const RestaurantDetailScreen({
    required this.id,
    super.key,
  });

  Future<RestaurantDetailModel> getRestaurantDetail() async {
    final dio = Dio();

    final repository = RestaurantRepository(
      dio,
      baseUrl: 'http://$ip/restaurant',
    );

    return repository.getRestaurantDetail(
      restaurantId: id,
    );

    // // Retrofit 적용 하기 전 코드
    // final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);
    // final resp = await dio.get(
    //   'http://$ip/restaurant/$id',
    //   options: Options(
    //     headers: {
    //       'authorization': 'Bearer $accessToken',
    //     },
    //   ),
    // );

    // return resp.data;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '이세계 아이돌',
      child: FutureBuilder<RestaurantDetailModel>(
        future: getRestaurantDetail(),
        builder: (
          context,
          AsyncSnapshot<RestaurantDetailModel> snapshot,
        ) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // retro fit 도입 이후 snapshot에 바로 RestaurantDetailModel과 매핑된
          // 데이터가 들어오기 때문에 item이 필요가 없어짐
          // final item = RestaurantDetailModel.fromJson(snapshot.data!);
          return CustomScrollView(
            slivers: [
              renderTop(model: snapshot.data!),
              renderLabel(),
              renderProducts(products: snapshot.data!.products),
            ],
          );
        },
      ),
    );
  }

  SliverToBoxAdapter renderTop({
    required RestaurantDetailModel model,
  }) {
    return SliverToBoxAdapter(
      child: RestaurantCard.fromRestaurantModel(
        restaurantModel: model,
        isDetail: true,
      ),

      // RestaurantCard(
      //   restaurantImage: Image.network(
      //     item.thumbUrl,
      //     fit: BoxFit.cover,
      //   ),
      //   name: item.name,
      //   tags: item.tags,
      //   ratingsCount: item.ratingsCount,
      //   deliveryTime: item.deliveryTime,
      //   deliveryFee: item.deliveryFee,
      //   ratings: item.ratings,
      //   isDetail: true,
      //   detail: item.detail,
      // ),
    );
  }

  SliverPadding renderLabel() {
    return const SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      sliver: SliverToBoxAdapter(
        child: Text(
          '메뉴',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  SliverPadding renderProducts({
    required List<RestaurantProductModel> products,
  }) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final model = products[index];

            return Padding(
              padding: const EdgeInsets.only(
                top: 16.0,
              ),
              child: ProductCard.fromModel(
                model: model,
              ),
            );
          },
          childCount: products.length,
        ),
      ),
    );
  }
}
