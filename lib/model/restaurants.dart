class Restaurants {
  String? _id;
  String? _name;
  String? _description;
  String? _pictureId;
  String? _city;
  double? _rating;

  String? get id => _id;
  String? get name => _name;
  String? get description => _description;
  String? get pictureId => _pictureId;
  String? get city => _city;
  double? get rating => _rating;

  Restaurants({
      String? id, 
      String? name, 
      String? description, 
      String? pictureId, 
      String? city, 
      double? rating}){
    _id = id;
    _name = name;
    _description = description;
    _pictureId = pictureId;
    _city = city;
    _rating = rating;
}

  Restaurants.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _description = json["description"];
    _pictureId = json["pictureId"];
    _city = json["city"];
    _rating = json['rating'].toDouble();
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["description"] = _description;
    map["pictureId"] = _pictureId;
    map["city"] = _city;
    map["rating"] = _rating;
    return map;
  }

}