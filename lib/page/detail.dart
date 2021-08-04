import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fundamental/model/restaurant.dart';

class DetailPage extends StatelessWidget {
  static const routeName = "/detail";
  final Restaurant restaurant;

  DetailPage({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Restaurant"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Image.network(
                      restaurant.pictureId.toString(),
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
                            "${restaurant.name}",
                            style: TextStyle(fontSize: 32),
                            textAlign: TextAlign.start,
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 12, left: 16, right: 16, bottom: 4),
                    child: Text("${restaurant.rating}/10"),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${restaurant.city}",
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.start,
                    )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${restaurant.description}",
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
                  itemCount: restaurant.menus?.foods?.length ?? 0,
                  itemBuilder: (ctx, index) {
                    return Card(
                        child: Text(
                            '${restaurant.menus?.foods?[index].name ?? ''},',
                        style: TextStyle(fontSize: 16),));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
