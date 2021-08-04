class Drinks {
  String? _name;

  String? get name => _name;

  Drinks({
      String? name}){
    _name = name;
}

  Drinks.fromJson(dynamic json) {
    _name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    return map;
  }

}