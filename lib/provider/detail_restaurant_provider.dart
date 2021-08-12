import 'package:flutter/foundation.dart';
import 'package:flutter_fundamental/model/detail_restaurant_response.dart';
import 'package:flutter_fundamental/network/api_services.dart';
import 'package:flutter_fundamental/provider/restaurant_provider.dart';

class DetailRestaurantProvider extends ChangeNotifier {
  final ApiServices apiService;
  String id;

  DetailRestaurantProvider({required this.apiService, required this.id}) {
    _fetchDetailRestaurant(id);
  }

  late DetailRestaurantResponse _detailRestaurantResponse;
  late ResultState _state;

  String _message = "";

  String get message => _message;

  DetailRestaurantResponse get restaurantResponse => _detailRestaurantResponse;

  ResultState get state => _state;


  Future<dynamic> _fetchDetailRestaurant(String id) async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final response = await apiService.getDetailRestaurant(id);
      if (response.restaurant == null) {
        _state = ResultState.HasNoData;
        notifyListeners();
        return _message = 'No Restaurant Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _detailRestaurantResponse = response;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = e.toString();
    }
  }

}