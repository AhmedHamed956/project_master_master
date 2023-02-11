import 'package:project/src/ui/delivery_package/data/model/delivery_data.dart';

class OrderRequestModel {
  OrderRequestModel({
    int? id,
    int? orderId,
    int? userId,
    int? deliveryOrderId,
    int? isAccpet,
    String? createdAt,
    String? updatedAt,
    DeliveryData? deliveryData,
  }) {
    _id = id;
    _orderId = orderId;
    _userId = userId;
    _deliveryOrderId = deliveryOrderId;
    _isAccpet = isAccpet;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deliveryData = deliveryData;
  }

  OrderRequestModel.fromJson(dynamic json) {
    _id = json['id'];
    // _orderId = json['order_id'];

    _userId = json['user_id'];
    _deliveryOrderId = json['delivery_order_id'];
    _isAccpet = json['is_accpet'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deliveryData = json['delivery_data'] != null
        ? DeliveryData.fromJson(json['delivery_data'])
        : null;
  }

  int? _id;
  int? _orderId;

  int? _userId;
  int? _deliveryOrderId;
  int? _isAccpet;
  String? _createdAt;
  String? _updatedAt;
  DeliveryData? _deliveryData;

  int? get id => _id;
  int? get orderId => _orderId;

  int? get userId => _userId;

  int? get deliveryOrderId => _deliveryOrderId;

  int? get isAccpet => _isAccpet;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  DeliveryData? get deliveryData => _deliveryData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['order_id'] = _orderId;

    map['user_id'] = _userId;
    map['delivery_order_id'] = _deliveryOrderId;
    map['is_accpet'] = _isAccpet;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_deliveryData != null) {
      map['delivery_data'] = _deliveryData?.toJson();
    }
    return map;
  }
}
