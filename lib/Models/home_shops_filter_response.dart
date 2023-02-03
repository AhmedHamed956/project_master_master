import 'model/location_model.dart';

class HomeShopsFilterResponse {
  HomeShopsFilterResponse({
    String? status,
    String? message,
    LocationModel? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  HomeShopsFilterResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? LocationModel.fromJson(json['data']) : null;
  }

  String? _status;
  String? _message;
  LocationModel? _data;

  String? get status => _status;

  String? get message => _message;

  LocationModel? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}
