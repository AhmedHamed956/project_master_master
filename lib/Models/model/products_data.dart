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
        ? ProductData.fromJson(json['products_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['product_id'] = productId;
    data['order_id'] = orderId;
    data['quantity'] = quantity;
    if (productsData != null) {
      data['products_data'] = productsData!.toJson();
    }
    return data;
  }
}
