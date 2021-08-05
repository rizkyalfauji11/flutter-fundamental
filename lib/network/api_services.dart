import 'package:flutter_fundamental/model/detail_restaurant_response.dart';
import 'package:flutter_fundamental/model/restaurant_response.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServices {
  static final _baseUrl = "https://restaurant-api.dicoding.dev/";
  static final _list = "list";
  static final _search = "search?q=";
  static final _detail = "detail/";

  Future<RestaurantResponse> getList() async {
    final response = await http.get(Uri.parse(_baseUrl + _list));
    if (response.statusCode == 200)
      return RestaurantResponse.fromJson(json.decode(response.body));
    else
      throw Exception('Failed to fetch list');
  }

  Future<RestaurantResponse> getListByName(String query) async {
    final response =
        await http.get(Uri.parse(_baseUrl + _search + query));
    print(Uri.parse(_baseUrl + _search + query));
    if (response.statusCode == 200)
      return RestaurantResponse.fromJson(json.decode(response.body));
    else
      throw Exception('Failed to fetch list');
  }

  Future<DetailRestaurantResponse> getDetailRestaurant(String id) async {
    final response = await http.get(Uri.parse(_baseUrl + _detail + id));
    if (response.statusCode == 200)
      return DetailRestaurantResponse.fromJson(json.decode(response.body));
    else
      throw Exception('Failed to fetch list');
  }
}
