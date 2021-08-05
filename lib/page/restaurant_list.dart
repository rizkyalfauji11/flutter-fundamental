import 'package:flutter/material.dart';
import 'package:flutter_fundamental/model/restaurants.dart';
import 'package:flutter_fundamental/provider/restaurant_provider.dart';
import 'package:flutter_fundamental/provider/search_provider.dart';
import 'package:provider/provider.dart';

import 'detail.dart';

class RestaurantListPage extends StatelessWidget {
  static const String baseImageUrl =
      "https://restaurant-api.dicoding.dev/images/medium/";

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantProvider>(builder: (context, state, _) {
      if (state.state == ResultState.Loading) {
        return Center(child: CircularProgressIndicator());
      } else if (state.state == ResultState.HasData) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: state.restaurantResponse.restaurants.length,
          itemBuilder: (context, index) {
            var restaurant = state.restaurantResponse.restaurants[index];
            return _itemRestaurant(context, restaurant);
          },
        );
      } else if (state.state == ResultState.HasNoData) {
        return Center(child: Text(state.message));
      } else if (state.state == ResultState.Error) {
        return Center(child: Text(state.message));
      } else {
        return Center(child: CircularProgressIndicator());
      }
    });
  }

  Widget _itemRestaurant(BuildContext context, Restaurants restaurant) {
    return ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Image.network(
          baseImageUrl + restaurant.pictureId.toString(),
          width: 100,
        ),
        title: Text(restaurant.name.toString()),
        subtitle: Text(restaurant.city.toString()),
        onTap: () {
          Navigator.pushNamed(context, DetailPage.routeName,
              arguments: restaurant);
        });
  }
}


class RestaurantSearchListPage extends StatelessWidget {
  static const String baseImageUrl =
      "https://restaurant-api.dicoding.dev/images/medium/";

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchRestaurantProvider>(builder: (context, state, _) {
      if (state.state == ResultState.Loading) {
        return Center(child: CircularProgressIndicator());
      } else if (state.state == ResultState.HasData) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: state.restaurantResponse.restaurants.length,
          itemBuilder: (context, index) {
            var restaurant = state.restaurantResponse.restaurants[index];
            return _itemRestaurant(context, restaurant);
          },
        );
      } else if (state.state == ResultState.HasNoData) {
        return Center(child: Text(state.message));
      } else if (state.state == ResultState.Error) {
        return Center(child: Text(state.message));
      } else {
        return Center(child: CircularProgressIndicator());
      }
    });
  }

  Widget _itemRestaurant(BuildContext context, Restaurants restaurant) {
    return ListTile(
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Image.network(
          baseImageUrl + restaurant.pictureId.toString(),
          width: 100,
        ),
        title: Text(restaurant.name.toString()),
        subtitle: Text(restaurant.city.toString()),
        onTap: () {
          Navigator.pushNamed(context, DetailPage.routeName,
              arguments: restaurant);
        });
  }
}
