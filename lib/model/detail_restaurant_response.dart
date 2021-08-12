import 'restaurant.dart';

class DetailRestaurantResponse {
  bool? _error;
  String? _message;
  Restaurant? _restaurant;

  bool? get error => _error;
  String? get message => _message;
  Restaurant? get restaurant => _restaurant;

  DetailRestaurantResponse({
      bool? error, 
      String? message, 
      Restaurant? restaurant}){
    _error = error;
    _message = message;
    _restaurant = restaurant;
}

  DetailRestaurantResponse.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _restaurant = json['restaurant'] != null ? Restaurant.fromJson(json['restaurant']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['error'] = _error;
    map['message'] = _message;
    if (_restaurant != null) {
      map['restaurant'] = _restaurant?.toJson();
    }
    return map;
  }

}