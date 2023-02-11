import 'package:project/Models/model/order_model.dart';

class ClientTrackingOrderResponse {
  ClientTrackingOrderResponse({
    String? status,
    Message? message,
    OrderModel? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  ClientTrackingOrderResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message =
        json['message'] != null ? Message.fromJson(json['message']) : null;
    _data = json['data'] != null ? OrderModel.fromJson(json['data']) : null;
  }

  String? _status;
  Message? _message;
  OrderModel? _data;

  String? get status => _status;

  Message? get message => _message;

  OrderModel? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_message != null) {
      map['message'] = _message?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class Message {
  Message({
    String? fcmTokenDelivery,
    String? userIdDelivery,
    String? dateOrder,
    bool? searchDelivery,
    bool? orderProgress,
    bool? isRedirectClient,
    bool? isClientDelivery,
    bool? isDone,
    String? deliveryName,
    String? luctionName,
    String? mobile,
  }) {
    _fcmTokenDelivery = fcmTokenDelivery;
    _userIdDelivery = userIdDelivery;
    _dateOrder = dateOrder;
    _searchDelivery = searchDelivery;
    _orderProgress = orderProgress;
    _isRedirectClient = isRedirectClient;
    _isClientDelivery = isClientDelivery;
    _isDone = isDone;
    _deliveryName = deliveryName;
    _luctionName = luctionName;
    _mobile = mobile;
  }

  Message.fromJson(dynamic json) {
    _fcmTokenDelivery = json['fcm_token_Delivery'];
    _userIdDelivery = json['user_id_Delivery'].toString();
    _dateOrder = json['date_order'];
    _searchDelivery = json['search_Delivery'];
    _orderProgress = json['order_progress'];
    _isRedirectClient = json['is_redirect_client'];
    _isClientDelivery = json['is_client_delivery'];
    _isDone = json['is_done'];
    _deliveryName = json['Delivery_name'];
    _luctionName = json['luction_name'];
    _mobile = json['mobile'];
  }

  String? _fcmTokenDelivery;
  String? _userIdDelivery;
  String? _dateOrder;
  bool? _searchDelivery;
  bool? _orderProgress;
  bool? _isRedirectClient;
  bool? _isClientDelivery;
  bool? _isDone;
  String? _deliveryName;
  String? _luctionName;
  String? _mobile;

  String? get fcmTokenDelivery => _fcmTokenDelivery;

  String? get userIdDelivery => _userIdDelivery;

  String? get dateOrder => _dateOrder;

  bool? get searchDelivery => _searchDelivery;

  bool? get orderProgress => _orderProgress;

  bool? get isRedirectClient => _isRedirectClient;

  bool? get isClientDelivery => _isClientDelivery;

  bool? get isDone => _isDone;

  String? get deliveryName => _deliveryName;

  String? get luctionName => _luctionName;

  String? get mobile => _mobile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fcm_token_Delivery'] = _fcmTokenDelivery;
    map['user_id_Delivery'] = _userIdDelivery;
    map['date_order'] = _dateOrder;
    map['search_Delivery'] = _searchDelivery;
    map['order_progress'] = _orderProgress;
    map['is_redirect_client'] = _isRedirectClient;
    map['is_client_delivery'] = _isClientDelivery;
    map['is_done'] = _isDone;
    map['Delivery_name'] = _deliveryName;
    map['luction_name'] = _luctionName;
    map['mobile'] = _mobile;
    return map;
  }
}
