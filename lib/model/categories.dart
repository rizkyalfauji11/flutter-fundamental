class Categories {
  String? _name;

  String? get name => _name;

  Categories({
      String? name}){
    _name = name;
}

  Categories.fromJson(dynamic json) {
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['name'] = _name;
    return map;
  }

}