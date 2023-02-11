class AcceptOrderModel {
  AcceptOrderModel({
    String? typeSend,
    String? whatsApp,
    int? orderNumber,
    String? shopName,
    String? latLongShop,
    String? latLongClient,
    String? clientId,
    String? clientFcmToken,
  }) {
    _typeSend = typeSend;
    _whatsApp = whatsApp;
    _orderNumber = orderNumber;
    _shopName = shopName;
    _latLongShop = latLongShop;
    _latLongClient = latLongClient;
    _clientId = clientId;
    _clientFcmToken = clientFcmToken;
  }

  AcceptOrderModel.fromJson(dynamic json) {
    _orderId = json['order_id'] == null ? null : int.tryParse(json['order_id']);
    _typeSend = json['type_send'];
    _whatsApp = json['whatsApp'] ?? "";
    _orderNumber = json['order_number'];
    _shopName = json['shop_name'];
    _latLongShop = json['lat_long_shop'];
    _latLongClient = json['lat_long_client'];
    _clientId = json['client_id'].toString();
    _clientFcmToken = json['fcm_token_client'];
  }

  int? _orderId;
  String? _typeSend;
  String? _whatsApp;
  int? _orderNumber;
  String? _shopName;
  String? _latLongShop;
  String? _latLongClient;
  String? _clientId;
  String? _clientFcmToken;

  int? get orderId => _orderId;

  String? get typeSend => _typeSend;

  String? get whatsApp => _whatsApp;

  int? get orderNumber => _orderNumber;

  String? get shopName => _shopName;

  String? get latLongShop => _latLongShop;

  String? get latLongClient => _latLongClient;

  String? get clientId => _clientId;

  String? get clientFcmToken => _clientFcmToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_id'] = _orderId;
    map['type_send'] = _typeSend;
    map['whatsApp'] = _whatsApp;
    map['order_number'] = _orderNumber;
    map['shop_name'] = _shopName;
    map['lat_long_shop'] = _latLongShop;
    map['lat_long_client'] = _latLongClient;
    map['client_id'] = _clientId;
    map['fcm_token_client'] = _clientFcmToken;

    return map;
  }
}
