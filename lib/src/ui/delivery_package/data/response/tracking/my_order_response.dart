import 'package:project/src/ui/delivery_package/data/model/accept_order_model.dart';
import 'package:project/src/ui/delivery_package/data/model/tracking/order_status_model.dart';

class MyOrderResponse {
  MyOrderResponse({
    String? status,
    String? message,
    OrderStatusModel? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  String? _status;
  String? _message;
  OrderStatusModel? _data;

  String? get status => _status;

  String? get message => _message;

  OrderStatusModel? get data => _data;

  MyOrderResponse.fromJson(dynamic json) {
    _status = json['status'];
    // _message = json['message'];
    _data =
        json['data'] != null ? OrderStatusModel.fromJson(json['data']) : null;
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
