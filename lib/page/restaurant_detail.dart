import 'package:flutter/material.dart';
import 'package:flutter_fundamental/model/restaurant.dart';
import 'package:flutter_fundamental/page/restaurant_list.dart';
import 'package:flutter_fundamental/provider/detail_restaurant_provider.dart';
import 'package:flutter_fundamental/provider/restaurant_provider.dart';
import 'package:provider/provider.dart';

class DetailRestaurantPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DetailRestaurantProvider>(builder: (context, state, _) {
      if (state.state == ResultState.Loading) {
        return Center(child: CircularProgressIndicator());
      } else if (state.state == ResultState.HasData) {
        return _detailRestaurantWidget(state.restaurantResponse.restaurant);
      } else if (state.state == ResultState.HasNoData) {
        return Center(child: Text(state.message));
      } else if (state.state == ResultState.Error) {
        return Center(child: Text(state.message));
      } else {
        return Center(child: CircularProgressIndicator());
      }
    });
  }

  Widget _detailRestaurantWidget(Restaurant? restaurant) {
    String imageId;
    if (restaurant != null) {
      imageId = restaurant.pictureId;
    } else {
      imageId = "0";
    }
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Image.network(
                    RestaurantListPage.baseImageUrl + imageId,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 12, left: 16, right: 16, bottom: 4),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${restaurant?.name}",
                          style: TextStyle(fontSize: 32),
                          textAlign: TextAlign.start,
                        )),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 12, left: 16, right: 16, bottom: 4),
                  child: Text("${restaurant?.rating}/10"),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${restaurant?.address}, ${restaurant?.city}",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.start,
                  )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${restaurant?.description}",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.start,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16, left: 16, bottom: 4),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Menu",
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.start,
                  )),
            ),
            Container(
              padding: EdgeInsets.only(left: 16),
              height: double.maxFinite,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: restaurant?.menus?.foods?.length ?? 0,
                itemBuilder: (ctx, index) {
                  return Card(
                      child: Text(
                    '${restaurant?.menus?.foods?[index].name ?? ''},',
                    style: TextStyle(fontSize: 16),
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
