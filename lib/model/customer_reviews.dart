class CustomerReviews {
  String? _name;
  String? _review;
  String? _date;

  String? get name => _name;
  String? get review => _review;
  String? get date => _date;

  CustomerReviews({
      String? name, 
      String? review, 
      String? date}){
    _name = name;
    _review = review;
    _date = date;
}

  CustomerReviews.fromJson(dynamic json) {
    _name = json['name'];
    _review = json['review'];
    _date = json['date'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['name'] = _name;
    map['review'] = _review;
    map['date'] = _date;
    return map;
  }

}