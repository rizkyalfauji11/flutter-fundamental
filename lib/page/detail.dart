import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fundamental/model/restaurants.dart';
import 'package:flutter_fundamental/network/api_services.dart';
import 'package:flutter_fundamental/page/restaurant_detail.dart';
import 'package:flutter_fundamental/page/restaurant_list.dart';
import 'package:flutter_fundamental/provider/database_provider.dart';
import 'package:flutter_fundamental/provider/detail_restaurant_provider.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  static const routeName = "/detail";
  final Restaurants restaurant;

  DetailPage({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        var id = restaurant.id ?? "";
        return FutureBuilder<bool>(
          future: provider.isBookmarked(id),
          builder: (context, snapshot) {
            var isBookmarked = snapshot.data ?? false;
            return Scaffold(
                appBar: AppBar(
                  title: Text("Restaurant"),
                  centerTitle: true,
                  actions: [
                    isBookmarked
                        ? IconButton(onPressed: () => provider.removeBookmark(id), icon: Icon(Icons.bookmark))
                        : IconButton(onPressed: () => provider.addBookmark(restaurant), icon: Icon(Icons.bookmark_border))
                  ],
                ),
                body: ChangeNotifierProvider<DetailRestaurantProvider>(
                  create: (_) => DetailRestaurantProvider(
                      apiService: ApiServices(), id: id),
                  child: DetailRestaurantPage(),
                ));
          },
        );
      },
    );
  }
}
