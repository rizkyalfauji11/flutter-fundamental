import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_fundamental/model/restaurants.dart';
import 'package:flutter_fundamental/network/api_services.dart';
import 'package:flutter_fundamental/page/detail.dart';
import 'package:flutter_fundamental/page/restaurant_list.dart';
import 'package:flutter_fundamental/page/search.dart';
import 'package:flutter_fundamental/page/search_input.dart';
import 'package:flutter_fundamental/provider/restaurant_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        DetailPage.routeName: (context) => DetailPage(
              restaurant:
                  ModalRoute.of(context)?.settings.arguments as Restaurants,
            ),
        SearchRestaurantPage.routeName: (context) => SearchRestaurantPage(
          query: ModalRoute.of(context)?.settings.arguments as String?,
        ),
        SearchInputPage.routeName: (context) => SearchInputPage()
      },
    );
  }
}

class HomePage extends StatefulWidget {
  static const routeName = "/home";

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Restaurants'),
          actions: [IconButton(onPressed: () {
            pushSearchInput();
          }, icon: Icon(Icons.search))],
        ),
        body: SafeArea(
            child: ChangeNotifierProvider<RestaurantProvider>(
          create: (_) => RestaurantProvider(apiService: ApiServices()),
          child: RestaurantListPage(),
        )));
  }

  pushSearchInput() async {
    await Navigator.pushNamed(context, SearchInputPage.routeName)
        .then((value) {
      Navigator.pushNamed(context, SearchRestaurantPage.routeName, arguments: value);
    });
  }
}
