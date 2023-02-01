class TabsDetailsModel {
  String? status;
  String? message;
  List<TabsData>? data;

  TabsDetailsModel({this.status, this.message, this.data});

  TabsDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <TabsData>[];
      json['data'].forEach((v) {
        data!.add(new TabsData.fromJson(v));
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

class TabsData {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  List<SameSubCategoryProducts>? sameSubCategoryProducts;
  List<ProductTranslations>? translations;

  TabsData(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.sameSubCategoryProducts,
      this.translations});

  TabsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    if (json['same_sub_category_products'] != null) {
      sameSubCategoryProducts = <SameSubCategoryProducts>[];
      json['same_sub_category_products'].forEach((v) {
        sameSubCategoryProducts!.add(new SameSubCategoryProducts.fromJson(v));
      });
    }
    if (json['translations'] != null) {
      translations = <ProductTranslations>[];
      json['translations'].forEach((v) {
        translations!.add(new ProductTranslations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    if (this.sameSubCategoryProducts != null) {
      data['same_sub_category_products'] =
          this.sameSubCategoryProducts!.map((v) => v.toJson()).toList();
    }
    if (this.translations != null) {
      data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SameSubCategoryProducts {
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
  List<ProductTranslations>? translations;

  SameSubCategoryProducts(
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

  SameSubCategoryProducts.fromJson(Map<String, dynamic> json) {
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
      translations = <ProductTranslations>[];
      json['translations'].forEach((v) {
        translations!.add(new ProductTranslations.fromJson(v));
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

class ProductTranslations {
  int? id;
  int? productId;
  String? locale;
  String? name;
  String? dis;
  Null? createdAt;
  Null? updatedAt;

  ProductTranslations(
      {this.id,
      this.productId,
      this.locale,
      this.name,
      this.dis,
      this.createdAt,
      this.updatedAt});

  ProductTranslations.fromJson(Map<String, dynamic> json) {
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

class TabTranslations {
  int? id;
  int? subCategoryId;
  String? locale;
  String? name;

  TabTranslations({this.id, this.subCategoryId, this.locale, this.name});

  TabTranslations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subCategoryId = json['sub_category_id'];
    locale = json['locale'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sub_category_id'] = this.subCategoryId;
    data['locale'] = this.locale;
    data['name'] = this.name;
    return data;
  }
}
