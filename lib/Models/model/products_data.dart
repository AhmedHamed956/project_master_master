import 'package:project/Models/model/product_data.dart';

class Products {
  int? id;
  int? productId;
  int? orderId;
  int? quantity;
  ProductData? productsData;

  Products(
      {this.id,
      this.productId,
      this.orderId,
      this.quantity,
      this.productsData});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    orderId = json['order_id'];
    quantity = json['quantity'];
    productsData = json['products_data'] != null
        ? new ProductData.fromJson(json['products_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['order_id'] = this.orderId;
    data['quantity'] = this.quantity;
    if (this.productsData != null) {
      data['products_data'] = this.productsData!.toJson();
    }
    return data;
  }
}
