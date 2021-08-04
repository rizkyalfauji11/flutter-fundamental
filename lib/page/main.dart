import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_fundamental/model/restaurant.dart';
import 'package:flutter_fundamental/page/detail.dart';

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
                  ModalRoute.of(context)?.settings.arguments as Restaurant,
            ),
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
        ),
        body: SafeArea(
            child: FutureBuilder<String>(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/local_restaurant.json'),
                builder: (context, snapshot) {
                  final List<Restaurant> restaurants =
                      parseRestaurant(snapshot.data);
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: restaurants.length,
                      itemBuilder: (context, index) {
                        return _itemRestaurant(context, restaurants[index]);
                      });
                })));
  }

  Widget _itemRestaurant(BuildContext context, Restaurant restaurant) {
    return ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Image.network(
          restaurant.pictureId.toString(),
          width: 100,
        ),
        title: Text(restaurant.name.toString()),
        subtitle: Text(restaurant.city.toString()),
        onTap: () {
          Navigator.pushNamed(context, DetailPage.routeName,
              arguments: restaurant);
        });
  }

  List<Restaurant> parseRestaurant(String? json) {
    if (json == null) {
      return [];
    }

    final List parsed = jsonDecode(json);
    return parsed.map((json) => Restaurant.fromJson(json)).toList();
  }
}
