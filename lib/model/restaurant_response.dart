import 'restaurants.dart';

class RestaurantResponse {
  bool? _error;
  String? _message;
  int? _count;
  List<Restaurants> _restaurants = [];

  bool? get error => _error;
  String? get message => _message;
  int? get count => _count;
  List<Restaurants> get restaurants => _restaurants;

  RestaurantResponse({
      bool? error,
      String? message,
      int? count,
      required List<Restaurants> restaurants}){
    _error = error;
    _message = message;
    _count = count;
    _restaurants = restaurants;
}

  RestaurantResponse.fromJson(dynamic json) {
    _error = json["error"];
    _message = json["message"];
    _count = json["count"];
    if (json["restaurants"] != null) {
      _restaurants = [];
      json["restaurants"].forEach((v) {
        _restaurants.add(Restaurants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["error"] = _error;
    map["message"] = _message;
    map["count"] = _count;
    if (_restaurants != null) {
      map["restaurants"] = _restaurants.map((v) => v.toJson()).toList();
    }
    return map;
  }

}