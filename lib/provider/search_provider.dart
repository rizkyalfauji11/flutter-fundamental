import 'package:flutter/foundation.dart';
import 'package:flutter_fundamental/model/restaurant_response.dart';
import 'package:flutter_fundamental/network/api_services.dart';
import 'package:flutter_fundamental/provider/restaurant_provider.dart';

class SearchRestaurantProvider extends ChangeNotifier {
  final ApiServices apiService;
  String query = "";

  SearchRestaurantProvider({required this.apiService, required this.query}) {
    _fetchRestaurant(query);
  }

  late RestaurantResponse _restaurantResponse;
  late ResultState _state;

  String _message = "";

  String get message => _message;

  RestaurantResponse get restaurantResponse => _restaurantResponse;

  ResultState get state => _state;


  Future<dynamic> _fetchRestaurant(String query) async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final response = await apiService.getListByName(query);
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