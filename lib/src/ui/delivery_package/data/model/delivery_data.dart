import 'package:project/src/ui/delivery_package/data/model/shop_data_model.dart';

class DeliveryData {
  DeliveryData({
    int? id,
    int? userId,
    int? detailOrderId,
    int? shopId,
    dynamic deliveryId,
    String? map,
    String? status,
    int? totalPrice,
    int? payed,
    String? typePay,
    String? deliveryDate,
    int? isAccpetd,
    int? done,
    String? createdAt,
    String? updatedAt,
    ShopData? shopData,
  }) {
    _id = id;
    _userId = userId;
    _detailOrderId = detailOrderId;
    _shopId = shopId;
    _deliveryId = deliveryId;
    _map = map;
    _status = status;
    _totalPrice = totalPrice;
    _payed = payed;
    _typePay = typePay;
    _deliveryDate = deliveryDate;
    _isAccpetd = isAccpetd;
    _done = done;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _shopData = shopData;
  }

  DeliveryData.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _detailOrderId = json['detail_order_id'];
    _shopId = json['shop_id'];
    _deliveryId = json['delivery_id'];
    _map = json['map'];
    _status = json['status'];
    _totalPrice = json['total_price'];
    _payed = json['payed'];
    _typePay = json['type_pay'];
    _deliveryDate = json['delivery_date'];
    _isAccpetd = json['is_accpetd'];
    _done = json['done'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _shopData =
        json['shop_data'] != null ? ShopData.fromJson(json['shop_data']) : null;
  }

  int? _id;
  int? _userId;
  int? _detailOrderId;
  int? _shopId;
  dynamic _deliveryId;
  String? _map;
  String? _status;
  int? _totalPrice;
  int? _payed;
  String? _typePay;
  String? _deliveryDate;
  int? _isAccpetd;
  int? _done;
  String? _createdAt;
  String? _updatedAt;
  ShopData? _shopData;

  int? get id => _id;

  int? get userId => _userId;

  int? get detailOrderId => _detailOrderId;

  int? get shopId => _shopId;

  dynamic get deliveryId => _deliveryId;

  String? get map => _map;

  String? get status => _status;

  int? get totalPrice => _totalPrice;

  int? get payed => _payed;

  String? get typePay => _typePay;

  String? get deliveryDate => _deliveryDate;

  int? get isAccpetd => _isAccpetd;

  int? get done => _done;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  ShopData? get shopData => _shopData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['detail_order_id'] = _detailOrderId;
    map['shop_id'] = _shopId;
    map['delivery_id'] = _deliveryId;
    map['map'] = _map;
    map['status'] = _status;
    map['total_price'] = _totalPrice;
    map['payed'] = _payed;
    map['type_pay'] = _typePay;
    map['delivery_date'] = _deliveryDate;
    map['is_accpetd'] = _isAccpetd;
    map['done'] = _done;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_shopData != null) {
      map['shop_data'] = _shopData?.toJson();
    }
    return map;
  }
}
