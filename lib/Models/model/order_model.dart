import 'package:project/Models/model/products_data.dart';
import 'package:project/Models/model/shop_model.dart';
import 'package:project/Models/model/user_model.dart';

class OrderModel {
  int? id;
  int? userId;
  int? detailOrderId;
  int? orderId;
  int? shopId;
  int? deliveryId;
  String? map;
  String? status;
  int? totalPrice;
  int? payed;
  int? isAccpetd;
  int? done;
  String? typePay;
  String? deliveryDate;
  String? createdAt;
  String? updatedAt;
  UserModel? deliveryUserData;
  int? total;
  int? deliveryCost;
  String? scheduler;
  int? isQuick;
  ShopData? shopData;
  List<Products>? products;
  DeliveryDetail? orderDetail;
  Rating? rating;

  OrderModel(
      {this.id,
      this.userId,
      this.detailOrderId,
      this.orderId,
      this.shopId,
      this.deliveryId,
      this.map,
      this.status,
      this.totalPrice,
      this.payed,
      this.isAccpetd,
      this.done,
      this.typePay,
      this.deliveryDate,
      this.createdAt,
      this.updatedAt,
      this.deliveryUserData,
      this.total,
      this.deliveryCost,
      this.scheduler,
      this.isQuick,
      this.shopData,
      this.products,
      this.orderDetail,
      this.rating});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    detailOrderId = json['detail_order_id'];
    orderId = json['order_id'];
    shopId = json['shop_id'];
    deliveryId = json['delivery_id'];
    map = json['map'];
    status = json['status'];
    totalPrice = json['total_price'];
    payed = json['payed'];
    isAccpetd = json['is_accpetd'];
    done = json['done'];
    typePay = json['type_pay'];
    deliveryDate = json['delivery_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deliveryUserData = json['delivery_user_data'] != null
        ? UserModel.fromJson(json['delivery_user_data'])
        : null;

    total = json['total'];
    deliveryCost = json['delivery_cost'];
    scheduler = json['scheduler'];
    isQuick = json['is_quick'];
    shopData =
        json['shop_data'] != null ? ShopData.fromJson(json['shop_data']) : null;
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    orderDetail = json['delivery_detail'] != null
        ? DeliveryDetail.fromJson(json['delivery_detail'])
        : null;
    rating = json['rating'] != null ? Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['detail_order_id'] = detailOrderId;
    data['order_id'] = orderId;
    data['shop_id'] = shopId;
    data['delivery_id'] = deliveryId;
    data['map'] = map;
    data['status'] = status;
    data['total_price'] = totalPrice;
    data['payed'] = payed;
    data['is_accpetd'] = isAccpetd;
    data['done'] = done;
    data['type_pay'] = typePay;
    data['delivery_date'] = deliveryDate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['total'] = total;
    data['delivery_cost'] = deliveryCost;
    data['scheduler'] = scheduler;
    data['is_quick'] = isQuick;
    if (deliveryUserData != null) {
      data['delivery_user_data'] = deliveryUserData!.toJson();
    }
    if (shopData != null) {
      data['shop_data'] = shopData!.toJson();
    }
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    if (orderDetail != null) {
      data['delivery_detail'] = orderDetail!.toJson();
    }
    if (rating != null) {
      data['rating'] = rating!.toJson();
    }
    return data;
  }
}

class DeliveryDetail {
  int? id;
  int? userId;
  int? detailOrderId;
  int? orderId;
  int? shopId;
  int? deliveryId;
  String? map;
  String? status;
  int? totalPrice;
  int? payed;
  int? isAccpetd;
  int? done;
  String? typePay;
  String? deliveryDate;
  String? createdAt;
  String? updatedAt;
  UserModel? deliveryUserData;

  DeliveryDetail(
      {this.id,
      this.userId,
      this.detailOrderId,
      this.orderId,
      this.shopId,
      this.deliveryId,
      this.map,
      this.status,
      this.totalPrice,
      this.payed,
      this.isAccpetd,
      this.done,
      this.typePay,
      this.deliveryDate,
      this.createdAt,
      this.updatedAt,
      this.deliveryUserData});

  DeliveryDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    detailOrderId = json['detail_order_id'];
    orderId = json['order_id'];
    shopId = json['shop_id'];
    deliveryId = json['delivery_id'];
    map = json['map'];
    status = json['status'];
    totalPrice = json['total_price'];
    payed = json['payed'];
    isAccpetd = json['is_accpetd'];
    done = json['done'];
    typePay = json['type_pay'];
    deliveryDate = json['delivery_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deliveryUserData = json['delivery_user_data'] != null
        ? UserModel.fromJson(json['delivery_user_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['detail_order_id'] = detailOrderId;
    data['order_id'] = orderId;
    data['shop_id'] = shopId;
    data['delivery_id'] = deliveryId;
    data['map'] = map;
    data['status'] = status;
    data['total_price'] = totalPrice;
    data['payed'] = payed;
    data['is_accpetd'] = isAccpetd;
    data['done'] = done;
    data['type_pay'] = typePay;
    data['delivery_date'] = deliveryDate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (deliveryUserData != null) {
      data['delivery_user_data'] = deliveryUserData!.toJson();
    }
    return data;
  }
}

class Rating {
  int? id;
  int? orderId;
  int? shopId;
  int? userId;
  String? rating;
  String? note;
  String? createdAt;
  String? updatedAt;

  Rating(
      {this.id,
      this.orderId,
      this.shopId,
      this.userId,
      this.rating,
      this.note,
      this.createdAt,
      this.updatedAt});

  Rating.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    shopId = json['shop_id'];
    userId = json['user_id'];
    rating = json['rating'];
    note = json['note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_id'] = orderId;
    data['shop_id'] = shopId;
    data['user_id'] = userId;
    data['rating'] = rating;
    data['note'] = note;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
