import 'package:project/Models/model/location_model.dart';

class LocationResponse {
  LocationResponse({
    String? status,
    String? message,
    List<LocationModel>? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  LocationResponse.fromJson(
      // dynamic json
      Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(LocationModel.fromJson(v));
      });
    }
  }

  String? _status;
  String? _message;
  List<LocationModel>? _data;

  String? get status => _status;

  String? get message => _message;

  List<LocationModel>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
