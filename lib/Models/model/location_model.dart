import 'package:project/Models/model/shop_model.dart';

class LocationModel {
  LocationModel({
    int? id,
    String? name,
    int? govId,
    String? latLong,
    String? range,
    String? createdAt,
    String? updatedAt,
    List<ShopData>? shops,
  }) {
    _id = id;
    _name = name;
    _govId = govId;
    _latLong = latLong;
    _range = range;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _shops = shops;
  }

  LocationModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _govId = json['gov_id'];
    _latLong = json['lat_long'];
    _range = json['range'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['shops'] != null) {
      _shops = [];
      json['shops'].forEach((v) {
        _shops?.add(ShopData.fromJson(v));
      });
    }
  }

  int? _id;
  String? _name;
  int? _govId;
  String? _latLong;
  String? _range;
  String? _createdAt;
  String? _updatedAt;
  List<ShopData>? _shops;

  int? get id => _id;

  String? get name => _name;

  int? get govId => _govId;

  String? get latLong => _latLong;

  String? get range => _range;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  List<ShopData>? get shops => _shops;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['gov_id'] = _govId;
    map['lat_long'] = _latLong;
    map['range'] = _range;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_shops != null) {
      map['shops'] = _shops?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
