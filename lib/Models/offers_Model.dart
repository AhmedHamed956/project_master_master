class OffersModel {
  String? status;
  String? message;
  List<OffersData>? data;

  OffersModel({this.status, this.message, this.data});

  OffersModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <OffersData>[];
      json['data'].forEach((v) {
        data!.add(new OffersData.fromJson(v));
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

class OffersData {
  int? id;
  String? image;
  String? directedTo;
  int? isActive;
  List<int>? shopsIds;
  List<String>? subCategoryIds;
  List<String>? productsIds;
  List<int>? digitalProductsIds;
  List<int>? quickProductsIds;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? dis;
  List<Translations>? translations;

  OffersData(
      {this.id,
      this.image,
      this.directedTo,
      this.isActive,
      this.shopsIds,
      this.subCategoryIds,
      this.productsIds,
      this.digitalProductsIds,
      this.quickProductsIds,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.dis,
      this.translations});

  OffersData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    directedTo = json['directed_to'];
    isActive = json['is_active'];
    // shopsIds = json['shops_Ids'].cast<int>();
    // subCategoryIds = json['sub_category_Ids'].cast<String>();
    // productsIds = json['products_Ids'].cast<String>();
    // digitalProductsIds = json['digital_products_Ids'].cast<int>();
    // quickProductsIds = json['quick_products_Ids'].cast<int>();
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
    data['image'] = this.image;
    data['directed_to'] = this.directedTo;
    data['is_active'] = this.isActive;
    data['shops_Ids'] = this.shopsIds;
    data['sub_category_Ids'] = this.subCategoryIds;
    data['products_Ids'] = this.productsIds;
    data['digital_products_Ids'] = this.digitalProductsIds;
    data['quick_products_Ids'] = this.quickProductsIds;
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
  int? offerId;
  String? locale;
  String? name;
  String? dis;
  Null? createdAt;
  Null? updatedAt;

  Translations(
      {this.id,
      this.offerId,
      this.locale,
      this.name,
      this.dis,
      this.createdAt,
      this.updatedAt});

  Translations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    offerId = json['offer_id'];
    locale = json['locale'];
    name = json['name'];
    dis = json['dis'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['offer_id'] = this.offerId;
    data['locale'] = this.locale;
    data['name'] = this.name;
    data['dis'] = this.dis;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
