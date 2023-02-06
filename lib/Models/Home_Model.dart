import 'model/shop_model.dart';

class HomeModel {
  String? status;
  String? message;
  List<ShopData>? data;

  HomeModel({this.status, this.message, this.data});

  HomeModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ShopData>[];
      json['data'].forEach((v) {
        data!.add(ShopData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


