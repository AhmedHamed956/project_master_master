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
  ActivityData? activityData;

  ShopData(
      {this.id,
      this.name,
      this.userId,
      this.govId,
      this.cityId,
      this.activityId,
      this.active,
      this.createdAt,
      this.updatedAt,
      this.activityData});

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
    activityData = json['activity_data'] != null
        ? new ActivityData.fromJson(json['activity_data'])
        : null;
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
    if (this.activityData != null) {
      data['activity_data'] = this.activityData!.toJson();
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
