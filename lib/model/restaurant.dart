import 'categories.dart';
import 'menus.dart';
import 'customer_reviews.dart';

class Restaurant {
  String _id = "0";
  String? _name;
  String? _description;
  String? _city;
  String? _address;
  String _pictureId = "0";
  List<Categories>? _categories;
  Menus? _menus;
  double? _rating;
  List<CustomerReviews>? _customerReviews;

  String get id => _id;

  String? get name => _name;

  String? get description => _description;

  String? get city => _city;

  String? get address => _address;

  String get pictureId => _pictureId;

  List<Categories>? get categories => _categories;

  Menus? get menus => _menus;

  double? get rating => _rating;

  List<CustomerReviews>? get customerReviews => _customerReviews;

  Restaurant(
      {required String id,
      String? name,
      String? description,
      String? city,
      String? address,
      required String pictureId,
      List<Categories>? categories,
      Menus? menus,
      double? rating,
      List<CustomerReviews>? customerReviews}) {
    _id = id;
    _name = name;
    _description = description;
    _city = city;
    _address = address;
    _pictureId = pictureId;
    _categories = categories;
    _menus = menus;
    _rating = rating;
    _customerReviews = customerReviews;
  }

  Restaurant.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _city = json['city'];
    _address = json['address'];
    _pictureId = json['pictureId'];
    if (json['categories'] != null) {
      _categories = [];
      json['categories'].forEach((v) {
        _categories?.add(Categories.fromJson(v));
      });
    }
    _menus = json['menus'] != null ? Menus.fromJson(json['menus']) : null;
    _rating = json['rating'].toDouble();
    if (json['customerReviews'] != null) {
      _customerReviews = [];
      json['customerReviews'].forEach((v) {
        _customerReviews?.add(CustomerReviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['city'] = _city;
    map['address'] = _address;
    map['pictureId'] = _pictureId;
    if (_categories != null) {
      map['categories'] = _categories?.map((v) => v.toJson()).toList();
    }
    if (_menus != null) {
      map['menus'] = _menus?.toJson();
    }
    map['rating'] = _rating;
    if (_customerReviews != null) {
      map['customerReviews'] =
          _customerReviews?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
