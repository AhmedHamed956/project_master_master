class DeliveryStateModel {
  DeliveryStateModel({
    int? id,
    int? userId,
    String? map,
    String? cityId,
    int? autoAccpet,
    int? active,
    int? hasOrder,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _userId = userId;
    _map = map;
    _cityId = cityId;
    _autoAccpet = autoAccpet;
    _active = active;
    _hasOrder = hasOrder;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  int? _id;
  int? _userId;
  String? _map;
  String? _cityId;
  int? _autoAccpet;
  int? _active;
  int? _hasOrder;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;

  int? get userId => _userId;

  String? get map => _map;

  String? get cityId => _cityId;

  int? get autoAccpet => _autoAccpet;

  int? get active => _active;

  int? get hasOrder => _hasOrder;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  DeliveryStateModel.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _map = json['map'];
    _cityId = json['city_id'].toString();
    // _autoAccpet = json['auto_accpet'];
    _autoAccpet = int.tryParse(json['auto_accpet'].toString());
    _active = int.tryParse(json['active'].toString());
    // _active = json['active'];
    _hasOrder = json['has_order'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['map'] = _map;
    map['city_id'] = _cityId;
    map['auto_accpet'] = _autoAccpet;
    map['active'] = _active;
    map['has_order'] = _hasOrder;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
