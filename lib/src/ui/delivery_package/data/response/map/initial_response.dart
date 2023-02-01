import 'package:project/src/ui/delivery_package/data/model/delivey_state_model.dart';

class InitialResponse {
  InitialResponse({
    String? status,
    String? message,
    DeliveryStateModel? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  InitialResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data =
        json['data'] != null ? DeliveryStateModel.fromJson(json['data']) : null;
  }

  String? _status;
  String? _message;
  DeliveryStateModel? _data;

  String? get status => _status;

  String? get message => _message;

  DeliveryStateModel? get data => _data;

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
