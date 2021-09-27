/// stored_ingredients : [{"id":1,"gtin":"12345","name":"Tomato","expiry_countdown_in_days":30,"kg":10.0}]

class Items2 {
  Items2({
    List<Stored_ingredients>? storedIngredients,
  }) {
    _storedIngredients = storedIngredients;
  }

  Items2.fromJson(dynamic json) {
    if (json['stored_ingredients'] != null) {
      _storedIngredients = [];
      json['stored_ingredients'].forEach((v) {
        _storedIngredients?.add(Stored_ingredients.fromJson(v));
      });
    }
  }
  List<Stored_ingredients>? _storedIngredients;

  List<Stored_ingredients>? get storedIngredients => _storedIngredients;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_storedIngredients != null) {
      map['stored_ingredients'] =
          _storedIngredients?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 1
/// gtin : "12345"
/// name : "Tomato"
/// expiry_countdown_in_days : 30
/// kg : 10.0

class Stored_ingredients {
  Stored_ingredients({
    int? id,
    String? gtin,
    String? name,
    int? expiryCountdownInDays,
    double? kg,
  }) {
    _id = id;
    _gtin = gtin;
    _name = name;
    _expiryCountdownInDays = expiryCountdownInDays;
    _kg = kg;
  }

  Stored_ingredients.fromJson(dynamic json) {
    _id = json['id'];
    _gtin = json['gtin'];
    _name = json['name'];
    _expiryCountdownInDays = json['expiry_countdown_in_days'];
    _kg = json['kg'];
  }
  int? _id;
  String? _gtin;
  String? _name;
  int? _expiryCountdownInDays;
  double? _kg;

  int? get id => _id;
  String? get gtin => _gtin;
  String? get name => _name;
  int? get expiryCountdownInDays => _expiryCountdownInDays;
  double? get kg => _kg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['gtin'] = _gtin;
    map['name'] = _name;
    map['expiry_countdown_in_days'] = _expiryCountdownInDays;
    map['kg'] = _kg;
    return map;
  }
}
