import 'model/shop_model.dart';
import 'model/translations_model.dart';

class DigitalOrderModel {
  String? status;
  String? message;
  List<DigitalOrderData>? data;

  DigitalOrderModel({this.status, this.message, this.data});

  DigitalOrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DigitalOrderData>[];
      json['data'].forEach((v) {
        data!.add(new DigitalOrderData.fromJson(v));
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

class DigitalOrderData {
  int? id;
  int? digitalShopId;
  List<String>? prices;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? dis;
  ShopData? shopData;
  List<Translations>? translations;

  DigitalOrderData(
      {this.id,
      this.digitalShopId,
      this.prices,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.dis,
      this.shopData,
      this.translations});

  DigitalOrderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    digitalShopId = json['digital_shop_id'];
    prices = json['prices'].cast<String>();

    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    dis = json['dis'];
    shopData = json['shop_data'] != null
        ? new ShopData.fromJson(json['shop_data'])
        : null;
    if (json['translations'] != null) {
      translations = <Translations>[];
      json['translations'].forEach((v) {
        translations!.add(new Translations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['digital_shop_id'] = this.digitalShopId;
    data['prices'] = this.prices;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    data['dis'] = this.dis;
    if (this.shopData != null) {
      data['shop_data'] = this.shopData!.toJson();
    }
    if (this.translations != null) {
      data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ActivityData {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  ActivityData({this.id, this.name, this.createdAt, this.updatedAt});

  ActivityData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
