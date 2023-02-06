import 'model/product_data.dart';
import 'model/products_data.dart';
import 'model/shop_model.dart';
import 'model/translations_model.dart';

class ClientTrakingOrderModel {
  String? status;
  Message? message;
  ClientTrakingOrderData? data;

  ClientTrakingOrderModel({this.status, this.message, this.data});

  ClientTrakingOrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message =
        json['message'] != null ? new Message.fromJson(json['message']) : null;
    data = json['data'] != null
        ? new ClientTrakingOrderData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Message {
  String? dateOrder;
  bool? searchDelivery;
  bool? orderProgress;
  bool? isRedirectClient;
  bool? isClientDelivery;
  bool? isDone;
  String? deliveryName;
  Null? luctionName;
  String? mobile;

  Message(
      {this.dateOrder,
      this.searchDelivery,
      this.orderProgress,
      this.isRedirectClient,
      this.isClientDelivery,
      this.isDone,
      this.deliveryName,
      this.luctionName,
      this.mobile});

  Message.fromJson(Map<String, dynamic> json) {
    dateOrder = json['date_order'];
    searchDelivery = json['search_Delivery'];
    orderProgress = json['order_progress'];
    isRedirectClient = json['is_redirect_client'];
    isClientDelivery = json['is_client_delivery'];
    isDone = json['is_done'];
    deliveryName = json['Delivery_name'];
    luctionName = json['luction_name'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date_order'] = this.dateOrder;
    data['search_Delivery'] = this.searchDelivery;
    data['order_progress'] = this.orderProgress;
    data['is_redirect_client'] = this.isRedirectClient;
    data['is_client_delivery'] = this.isClientDelivery;
    data['is_done'] = this.isDone;
    data['Delivery_name'] = this.deliveryName;
    data['luction_name'] = this.luctionName;
    data['mobile'] = this.mobile;
    return data;
  }
}

class ClientTrakingOrderData {
  int? id;
  int? userId;
  int? shopId;
  int? total;
  int? deliveryCost;
  int? totalPrice;
  String? status;
  Null? scheduler;
  int? isQuick;
  String? createdAt;
  String? updatedAt;
  List<Products>? products;
  ShopData? shopData;
  OrderDetail? orderDetail;

  ClientTrakingOrderData(
      {this.id,
      this.userId,
      this.shopId,
      this.total,
      this.deliveryCost,
      this.totalPrice,
      this.status,
      this.scheduler,
      this.isQuick,
      this.createdAt,
      this.updatedAt,
      this.products,
      this.shopData,
      this.orderDetail});

  ClientTrakingOrderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    shopId = json['shop_id'];
    total = json['total'];
    deliveryCost = json['delivery_cost'];
    totalPrice = json['total_price'];
    status = json['status'];
    scheduler = json['scheduler'];
    isQuick = json['is_quick'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    shopData = json['shop_data'] != null
        ? new ShopData.fromJson(json['shop_data'])
        : null;
    orderDetail = json['order_detail'] != null
        ? new OrderDetail.fromJson(json['order_detail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['shop_id'] = this.shopId;
    data['total'] = this.total;
    data['delivery_cost'] = this.deliveryCost;
    data['total_price'] = this.totalPrice;
    data['status'] = this.status;
    data['scheduler'] = this.scheduler;
    data['is_quick'] = this.isQuick;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.shopData != null) {
      data['shop_data'] = this.shopData!.toJson();
    }
    if (this.orderDetail != null) {
      data['order_detail'] = this.orderDetail!.toJson();
    }
    return data;
  }
}

class OrderDetail {
  int? id;
  String? name;
  String? phone;
  int? total;
  String? typePay;
  String? typeSend;
  String? map;
  String? status;
  int? orderId;
  int? shopId;
  int? payed;
  int? userId;
  String? createdAt;
  String? updatedAt;

  OrderDetail(
      {this.id,
      this.name,
      this.phone,
      this.total,
      this.typePay,
      this.typeSend,
      this.map,
      this.status,
      this.orderId,
      this.shopId,
      this.payed,
      this.userId,
      this.createdAt,
      this.updatedAt});

  OrderDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    total = json['total'];
    typePay = json['type_pay'];
    typeSend = json['type_send'];
    map = json['map'];
    status = json['status'];
    orderId = json['order_id'];
    shopId = json['shop_id'];
    payed = json['payed'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['total'] = this.total;
    data['type_pay'] = this.typePay;
    data['type_send'] = this.typeSend;
    data['map'] = this.map;
    data['status'] = this.status;
    data['order_id'] = this.orderId;
    data['shop_id'] = this.shopId;
    data['payed'] = this.payed;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
