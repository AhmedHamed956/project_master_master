import 'package:project/src/ui/delivery_package/data/model/accept_order_model.dart';
import 'package:project/src/ui/delivery_package/data/model/order_request_model.dart';

class CheckNewOrderResponse {
  CheckNewOrderResponse({
    String? status,
    List<String>? message,
    AcceptOrderModel? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  CheckNewOrderResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'] != null ? json['message'].cast<String>() : [];
    _data =
        json['data'] != null ? AcceptOrderModel.fromJson(json['data']) : null;
  }

  String? _status;
  List<String>? _message;
  AcceptOrderModel? _data;

  String? get status => _status;

  List<String>? get message => _message;

  AcceptOrderModel? get data => _data;

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
