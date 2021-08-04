import 'menus.dart';

class Restaurant {
  String? _id;
  String? _name;
  String? _description;
  String? _pictureId;
  String? _city;
  double? _rating;
  Menus? _menus;

  String? get id => _id;
  String? get name => _name;
  String? get description => _description;
  String? get pictureId => _pictureId;
  String? get city => _city;
  double? get rating => _rating;
  Menus? get menus => _menus;

  Restaurant({
      String? id, 
      String? name, 
      String? description, 
      String? pictureId, 
      String? city, 
      double? rating, 
      Menus? menus}){
    _id = id;
    _name = name;
    _description = description;
    _pictureId = pictureId;
    _city = city;
    _rating = rating;
    _menus = menus;
}

  Restaurant.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _description = json["description"];
    _pictureId = json["pictureId"];
    _city = json["city"];
    _rating = json["rating"];
    _menus = json["menus"] != null ? Menus.fromJson(json["menus"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["description"] = _description;
    map["pictureId"] = _pictureId;
    map["city"] = _city;
    map["rating"] = _rating;
    if (_menus != null) {
      map["menus"] = _menus?.toJson();
    }
    return map;
  }
}