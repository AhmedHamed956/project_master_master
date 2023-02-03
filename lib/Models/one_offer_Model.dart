import 'model/shop_model.dart';

class OneOffersModel {
  String? status;
  String? message;
  List<ShopData>? data;

  OneOffersModel({this.status, this.message, this.data});

  OneOffersModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ShopData>[];
      json['data'].forEach((v) {
        data!.add(new ShopData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

