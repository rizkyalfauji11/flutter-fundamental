class Foods {
  String? _name;

  String? get name => _name;

  Foods({
      String? name}){
    _name = name;
}

  Foods.fromJson(dynamic json) {
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['name'] = _name;
    return map;
  }

}