class GetnonReadyQuickModel {
  String? status;
  int? message;
  List<GetnonReadyQuickModelData>? data;

  GetnonReadyQuickModel({this.status, this.message, this.data});

  GetnonReadyQuickModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetnonReadyQuickModelData>[];
      json['data'].forEach((v) {
        data!.add(new GetnonReadyQuickModelData.fromJson(v));
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

class GetnonReadyQuickModelData {
  int? id;
  int? productId;
  int? userId;
  int? shopId;
  int? toMe;
  int? isAccpet;
  int? quantity;
  int? end;
  int? step;
  String? createdAt;
  String? updatedAt;
  ProductsData? productsData;

  GetnonReadyQuickModelData(
      {this.id,
      this.productId,
      this.userId,
      this.shopId,
      this.toMe,
      this.isAccpet,
      this.quantity,
      this.end,
      this.step,
      this.createdAt,
      this.updatedAt,
      this.productsData});

  GetnonReadyQuickModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    userId = json['user_id'];
    shopId = json['shop_id'];
    toMe = json['to_me'];
    isAccpet = json['is_accpet'];
    quantity = json['quantity'];
    end = json['end'];
    step = json['step'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    productsData = json['products_data'] != null
        ? new ProductsData.fromJson(json['products_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['user_id'] = this.userId;
    data['shop_id'] = this.shopId;
    data['to_me'] = this.toMe;
    data['is_accpet'] = this.isAccpet;
    data['quantity'] = this.quantity;
    data['end'] = this.end;
    data['step'] = this.step;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.productsData != null) {
      data['products_data'] = this.productsData!.toJson();
    }
    return data;
  }
}

class ProductsData {
  int? id;
  int? subCategoryId;
  int? shopId;
  String? price;
  String? priceAfterDiscount;
  int? consigneeId;
  int? occasionId;
  String? masterImage;
  String? subImages;
  int? isQuick;
  int? isAvailable;
  int? isShow;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? dis;
  List<Translations>? translations;

  ProductsData(
      {this.id,
      this.subCategoryId,
      this.shopId,
      this.price,
      this.priceAfterDiscount,
      this.consigneeId,
      this.occasionId,
      this.masterImage,
      this.subImages,
      this.isQuick,
      this.isAvailable,
      this.isShow,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.dis,
      this.translations});

  ProductsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subCategoryId = json['sub_category_id'];
    shopId = json['shop_id'];
    price = json['price'];
    priceAfterDiscount = json['price_after_discount'];
    consigneeId = json['consignee_id'];
    occasionId = json['occasion_id'];
    masterImage = json['master_image'];
    subImages = json['sub_images'];
    isQuick = json['is_quick'];
    isAvailable = json['is_available'];
    isShow = json['is_show'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    dis = json['dis'];
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
    data['sub_category_id'] = this.subCategoryId;
    data['shop_id'] = this.shopId;
    data['price'] = this.price;
    data['price_after_discount'] = this.priceAfterDiscount;
    data['consignee_id'] = this.consigneeId;
    data['occasion_id'] = this.occasionId;
    data['master_image'] = this.masterImage;
    data['sub_images'] = this.subImages;
    data['is_quick'] = this.isQuick;
    data['is_available'] = this.isAvailable;
    data['is_show'] = this.isShow;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    data['dis'] = this.dis;
    if (this.translations != null) {
      data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Translations {
  int? id;
  int? productId;
  String? locale;
  String? name;
  String? dis;
  Null? createdAt;
  Null? updatedAt;

  Translations(
      {this.id,
      this.productId,
      this.locale,
      this.name,
      this.dis,
      this.createdAt,
      this.updatedAt});

  Translations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    locale = json['locale'];
    name = json['name'];
    dis = json['dis'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['locale'] = this.locale;
    data['name'] = this.name;
    data['dis'] = this.dis;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
