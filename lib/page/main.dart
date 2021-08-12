import 'dart:convert';
import 'dart:io';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fundamental/db/db_helper.dart';
import 'package:flutter_fundamental/model/restaurants.dart';
import 'package:flutter_fundamental/network/api_services.dart';
import 'package:flutter_fundamental/page/detail.dart';
import 'package:flutter_fundamental/page/restaurant_list.dart';
import 'package:flutter_fundamental/page/search.dart';
import 'package:flutter_fundamental/page/search_input.dart';
import 'package:flutter_fundamental/page/setting.dart';
import 'package:flutter_fundamental/provider/database_provider.dart';
import 'package:flutter_fundamental/provider/preference_provider.dart';
import 'package:flutter_fundamental/provider/restaurant_provider.dart';
import 'package:flutter_fundamental/provider/schduling_provider.dart';
import 'package:flutter_fundamental/utils/background_service.dart';
import 'package:flutter_fundamental/utils/notification_helper.dart';
import 'package:flutter_fundamental/utils/preference_helper.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final NotificationHelper _notificationHelper = NotificationHelper();
  final BackgroundService _service = BackgroundService();

  _service.initializeIsolate();

  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  await _notificationHelper.initNotifications(flutterLocalNotificationsPlugin);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => RestaurantProvider(apiService: ApiServices())),
        ChangeNotifierProvider(
            create: (_) => DatabaseProvider(databaseHelper: DatabaseHelper())),
        ChangeNotifierProvider(create: (_) => SchedulingProvider()),
        ChangeNotifierProvider(
          create: (_) => PreferencesProvider(
            preferencesHelper: PreferencesHelper(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (context) => HomePage(),
          DetailPage.routeName: (context) =>
              DetailPage(
                restaurant:
                ModalRoute
                    .of(context)
                    ?.settings
                    .arguments as Restaurants,
              ),
          SearchRestaurantPage.routeName: (context) =>
              SearchRestaurantPage(
                query: ModalRoute
                    .of(context)
                    ?.settings
                    .arguments as String?,
              ),
          SearchInputPage.routeName: (context) => SearchInputPage()
        },
      ),
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
  int _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _bottomNavIndex,
          items: _bottomNavBarItems,
          onTap: _onBottomNavTapped,
        ),
        appBar: AppBar(
          title: Text('Restaurants'),
          actions: [
            IconButton(
                onPressed: () {
                  pushSearchInput();
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: SafeArea(child: _listWidget[_bottomNavIndex]));
  }

  List<Widget> _listWidget = [
    RestaurantListPage(isBookmarkPage: false),
    RestaurantListPage(isBookmarkPage: true),
    SettingPage()
  ];

  pushSearchInput() async {
    await Navigator.pushNamed(context, SearchInputPage.routeName).then((value) {
      Navigator.pushNamed(context, SearchRestaurantPage.routeName,
          arguments: value);
    });
  }

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.restaurant),
      label: 'Restaurant',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.bookmark),
      label: 'Bookmark',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Setting',
    )
  ];
}
