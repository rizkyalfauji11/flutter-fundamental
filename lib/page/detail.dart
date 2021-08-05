import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fundamental/model/restaurants.dart';
import 'package:flutter_fundamental/network/api_services.dart';
import 'package:flutter_fundamental/page/restaurant_detail.dart';
import 'package:flutter_fundamental/page/restaurant_list.dart';
import 'package:flutter_fundamental/provider/detail_restaurant_provider.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  static const routeName = "/detail";
  final Restaurants restaurant;

  DetailPage({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Restaurant"),
          centerTitle: true,
        ),
        body: ChangeNotifierProvider<DetailRestaurantProvider>(
          create: (_) => DetailRestaurantProvider(
              apiService: ApiServices(), id: restaurant.id ?? ""),
          child: DetailRestaurantPage(),
        ));
  }
}
