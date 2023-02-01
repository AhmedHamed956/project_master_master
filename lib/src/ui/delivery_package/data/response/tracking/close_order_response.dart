import 'package:project/src/ui/delivery_package/data/model/order_request_model.dart';

class CloseOrderResponse {
  CloseOrderResponse({
    String? status,
    String? message,
    OrderRequestModel? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  String? _status;
  String? _message;
  OrderRequestModel? _data;

  String? get status => _status;

  String? get message => _message;

  OrderRequestModel? get data => _data;

  CloseOrderResponse.fromJson(dynamic json) {
    _status = json['status'];
    // _message = json['message'];
    _data =
        json['data'] != null ? OrderRequestModel.fromJson(json['data']) : null;
  }

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
