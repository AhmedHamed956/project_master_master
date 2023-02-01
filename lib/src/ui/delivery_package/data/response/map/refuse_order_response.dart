import 'package:project/src/ui/delivery_package/data/model/accept_order_model.dart';

class RefuseOrderResponse {
  RefuseOrderResponse({
    String? status,
    String? message,
    AcceptOrderModel? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  String? _status;
  String? _message;
  AcceptOrderModel? _data;

  String? get status => _status;

  String? get message => _message;

  AcceptOrderModel? get data => _data;

  RefuseOrderResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'].toString();
    _data =
        json['data'] != null ? AcceptOrderModel.fromJson(json['data']) : null;
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
