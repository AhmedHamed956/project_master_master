class OrderStatusModel {
  OrderStatusModel({
    int? id,
    int? userId,
    int? deliveryOrderId,
    String? orderId,
    int? isWhatsApp,
    int? isRedirectShop,
    int? isRatingShop,
    int? isRedirectClient,
    int? isClientDelivery,
    int? isPayed,
    int? isDone,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _userId = userId;
    _deliveryOrderId = deliveryOrderId;
    _orderId = orderId;
    _isWhatsApp = isWhatsApp;
    _isRedirectShop = isRedirectShop;
    _isRatingShop = isRatingShop;
    _isRedirectClient = isRedirectClient;
    _isClientDelivery = isClientDelivery;
    _isPayed = isPayed;
    _isDone = isDone;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  OrderStatusModel.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _deliveryOrderId = json['delivery_order_id'];
    _orderId = json['order_id'];
    _isWhatsApp = json['is_whatsApp'];
    _isRedirectShop = json['is_redirect_shop'];
    _isRatingShop = json['is_rating_shop'];
    _isRedirectClient = json['is_redirect_client'];
    _isClientDelivery = json['is_client_delivery'];
    _isPayed = json['is_payed'];
    _isDone = json['is_done'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  int? _id;
  int? _userId;
  int? _deliveryOrderId;
  String? _orderId;
  int? _isWhatsApp;
  int? _isRedirectShop;
  int? _isRatingShop;
  int? _isRedirectClient;
  int? _isClientDelivery;
  int? _isPayed;
  int? _isDone;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;

  int? get userId => _userId;

  int? get deliveryOrderId => _deliveryOrderId;

  String? get orderId => _orderId;

  int? get isWhatsApp => _isWhatsApp;

  int? get isRedirectShop => _isRedirectShop;

  int? get isRatingShop => _isRatingShop;

  int? get isRedirectClient => _isRedirectClient;

  int? get isClientDelivery => _isClientDelivery;

  int? get isPayed => _isPayed;

  int? get isDone => _isDone;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['delivery_order_id'] = _deliveryOrderId;
    map['order_id'] = _orderId;
    map['is_whatsApp'] = _isWhatsApp ?? 0;
    map['is_redirect_shop'] = _isRedirectShop ?? 0;
    map['is_rating_shop'] = _isRatingShop ?? 0;
    map['is_redirect_client'] = _isRedirectClient ?? 0;
    map['is_client_delivery'] = _isClientDelivery ?? 0;
    map['is_payed'] = _isPayed ?? 0;
    map['is_done'] = _isDone ?? 0;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

  set orderId(String? value) {
    _orderId = value;
  }

  set isWhatsApp(int? value) {
    _isWhatsApp = value;
  }

  set isDone(int? value) {
    _isDone = value;
  }

  set isPayed(int? value) {
    _isPayed = value;
  }

  set isClientDelivery(int? value) {
    _isClientDelivery = value;
  }

  set isRedirectClient(int? value) {
    _isRedirectClient = value;
  }

  set isRatingShop(int? value) {
    _isRatingShop = value;
  }

  set isRedirectShop(int? value) {
    _isRedirectShop = value;
  }

  set deliveryOrderId(int? value) {
    _deliveryOrderId = value;
  }
}
