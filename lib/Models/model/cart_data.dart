import 'package:project/Models/model/products_data.dart';
import 'package:project/Models/model/shop_model.dart';

import '../orders_response.dart';

class CartData {
  int? id;
  int? userId;
  int? shopId;
  int? total;
  int? deliveryCost;
  int? totalPrice;
  String? status;
  String? createdAt;
  String? updatedAt;
  ShopData? shopData;
  List<Products>? products;

  CartData(
      {this.id,
        this.userId,
        this.shopId,
        this.total,
        this.deliveryCost,
        this.totalPrice,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.shopData,
        this.products});

  CartData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    shopId = json['shop_id'];
    total = json['total'];
    deliveryCost = json['delivery_cost'];
    totalPrice = json['total_price'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    shopData = json['shop_data'] != null
        ? new ShopData.fromJson(json['shop_data'])
        : null;
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
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
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.shopData != null) {
      data['shop_data'] = this.shopData!.toJson();
    }
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
