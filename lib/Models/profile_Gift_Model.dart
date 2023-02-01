class ProfileGiftModel {
  String? status;
  String? message;
  List<ProfileGiftData>? data;

  ProfileGiftModel({this.status, this.message, this.data});

  ProfileGiftModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ProfileGiftData>[];
      json['data'].forEach((v) {
        data!.add(new ProfileGiftData.fromJson(v));
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

class ProfileGiftData {
  int? id;
  int? userId;
  int? digitalShopId;
  int? digitalProductId;
  int? userSendId;
  int? totalPrice;
  int? isUsed;
  String? status;
  String? createdAt;
  String? updatedAt;
  ProductData? productData;
  ShopData? shopData;

  ProfileGiftData(
      {this.id,
      this.userId,
      this.digitalShopId,
      this.digitalProductId,
      this.userSendId,
      this.totalPrice,
      this.isUsed,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.productData,
      this.shopData});

  ProfileGiftData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    digitalShopId = json['digital_shop_id'];
    digitalProductId = json['digital_product_id'];
    userSendId = json['user_send_id'];
    totalPrice = json['total_price'];
    isUsed = json['is_used'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    productData = json['product_data'] != null
        ? new ProductData.fromJson(json['product_data'])
        : null;
    shopData = json['shop_data'] != null
        ? new ShopData.fromJson(json['shop_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['digital_shop_id'] = this.digitalShopId;
    data['digital_product_id'] = this.digitalProductId;
    data['user_send_id'] = this.userSendId;
    data['total_price'] = this.totalPrice;
    data['is_used'] = this.isUsed;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.productData != null) {
      data['product_data'] = this.productData!.toJson();
    }
    if (this.shopData != null) {
      data['shop_data'] = this.shopData!.toJson();
    }
    return data;
  }
}

class ProductData {
  int? id;
  int? digitalShopId;
  List<String>? prices;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? dis;
  List<Translations>? translations;

  ProductData(
      {this.id,
      this.digitalShopId,
      this.prices,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.dis,
      this.translations});

  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    digitalShopId = json['digital_shop_id'];
    prices = json['prices'].cast<String>();
    image = json['image'];
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
    data['digital_shop_id'] = this.digitalShopId;
    data['prices'] = this.prices;
    data['image'] = this.image;
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
  int? digitalProductId;
  String? locale;
  String? name;
  String? dis;

  Translations(
      {this.id, this.digitalProductId, this.locale, this.name, this.dis});

  Translations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    digitalProductId = json['digital_product_id'];
    locale = json['locale'];
    name = json['name'];
    dis = json['dis'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['digital_product_id'] = this.digitalProductId;
    data['locale'] = this.locale;
    data['name'] = this.name;
    data['dis'] = this.dis;
    return data;
  }
}

class ShopData {
  int? id;
  String? name;
  int? userId;
  int? govId;
  int? cityId;
  int? activityId;
  int? active;
  String? createdAt;
  String? updatedAt;

  ShopData(
      {this.id,
      this.name,
      this.userId,
      this.govId,
      this.cityId,
      this.activityId,
      this.active,
      this.createdAt,
      this.updatedAt});

  ShopData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userId = json['user_id'];
    govId = json['gov_id'];
    cityId = json['city_id'];
    activityId = json['activity_id'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['user_id'] = this.userId;
    data['gov_id'] = this.govId;
    data['city_id'] = this.cityId;
    data['activity_id'] = this.activityId;
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
