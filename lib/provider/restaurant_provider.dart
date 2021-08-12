import 'package:flutter/material.dart';
import 'package:flutter_fundamental/model/restaurant_response.dart';
import 'package:flutter_fundamental/network/api_services.dart';

enum ResultState { Loading, HasNoData, HasData, Error }

class RestaurantProvider extends ChangeNotifier {
  final ApiServices apiService;

  RestaurantProvider({required this.apiService}) {
    _fetchRestaurant();
  }

  late RestaurantResponse _restaurantResponse;
  late ResultState _state;

  String _message = "";

  String get message => _message;

  RestaurantResponse get restaurantResponse => _restaurantResponse;

  ResultState get state => _state;

  Future<dynamic> _fetchRestaurant() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final response = await apiService.getList();
      if (response.restaurants.isEmpty == true) {
        _state = ResultState.HasNoData;
        notifyListeners();
        return _message = 'No Restaurants';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restaurantResponse = response;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = e.toString();
    }
  }
}
