import 'package:flutter/material.dart';
import 'package:flutter_fundamental/network/api_services.dart';
import 'package:flutter_fundamental/page/restaurant_list.dart';
import 'package:flutter_fundamental/provider/search_provider.dart';
import 'package:provider/provider.dart';

class SearchRestaurantPage extends StatefulWidget {
  static const routeName = "/search";
  String? query;

  SearchRestaurantPage({this.query});

  @override
  _SearchRestaurantPageState createState() =>
      _SearchRestaurantPageState(query: query);
}

class _SearchRestaurantPageState extends State<SearchRestaurantPage> {
  String? query;

  _SearchRestaurantPageState({this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("$query")),
        body: SafeArea(
            child: query == null
                ? Center(
                    child: Text('Search Restaurant'),
                  )
                : ChangeNotifierProvider<SearchRestaurantProvider>(
                    create: (_) => SearchRestaurantProvider(
                        apiService: ApiServices(), query: query ?? ""),
                    child: RestaurantSearchListPage(),
                  )));
  }
}
