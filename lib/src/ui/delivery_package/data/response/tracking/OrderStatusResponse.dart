import 'package:project/src/ui/delivery_package/data/model/tracking/order_status_model.dart';

class OrderStatusResponse {
  OrderStatusResponse({
    String? status,
    bool? message,
    OrderStatusModel? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  OrderStatusResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data =
        json['data'] != null ? OrderStatusModel.fromJson(json['data']) : null;
  }

  String? _status;
  bool? _message;
  OrderStatusModel? _data;

  String? get status => _status;

  bool? get message => _message;

  OrderStatusModel? get data => _data;

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
