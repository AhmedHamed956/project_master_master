import 'package:project/Models/model/shop_model.dart';

import 'translations_model.dart';

class ProductData {
  int? id;
  int? productId;
  int? subCategoryId;
  int? shopId;
  String? price;
  String? priceAfterDiscount;
  int? consigneeId;
  int? occasionId;
  String? masterImage;
  String? subImages;
  int? isQuick;
  int? isShow;
  int? isAvailable;
  List<String>? suggestIds;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? dis;
  ShopData? shopData;
  List<Translations>? translations;

  ProductData(
      {this.id,
      this.productId,
      this.subCategoryId,
      this.shopId,
      this.price,
      this.priceAfterDiscount,
      this.consigneeId,
      this.occasionId,
      this.masterImage,
      this.subImages,
      this.isQuick,
      this.isShow,
      this.isAvailable,
      this.suggestIds,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.dis,
      this.shopData,
      this.translations});

  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    subCategoryId = json['sub_category_id'];
    shopId = json['shop_id'];
    price = json['price'];
    priceAfterDiscount = json['price_after_discount'];
    consigneeId = json['consignee_id'];
    occasionId = json['occasion_id'];
    masterImage = json['master_image'];
    subImages = json['sub_images'];
    isQuick = json['is_quick'];
    isShow = json['is_show'];
    isAvailable = json['is_available'];
    suggestIds = json['suggest_Ids']?.cast<String>();
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
    data['product_id'] = this.productId;
    data['sub_category_id'] = this.subCategoryId;
    data['shop_id'] = this.shopId;
    data['price'] = this.price;
    data['price_after_discount'] = this.priceAfterDiscount;
    data['consignee_id'] = this.consigneeId;
    data['occasion_id'] = this.occasionId;
    data['master_image'] = this.masterImage;
    data['sub_images'] = this.subImages;
    data['is_quick'] = this.isQuick;
    data['is_show'] = this.isShow;
    data['is_available'] = this.isAvailable;
    data['suggest_Ids'] = this.suggestIds;
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
