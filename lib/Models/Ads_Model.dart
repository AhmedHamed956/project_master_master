// class AdsModel {
//   String? status;
//   String? message;
//   List<AdsData>? data;

//   AdsModel({this.status, this.message, this.data});

//   AdsModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = <AdsData>[];
//       json['data'].forEach((v) {
//         data!.add(new AdsData.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class AdsData {
//   int? id;
//   String? image;
//   String? directedTo;
//   int? isActive;
//   List<int>? shopsIds;
//   Null? subCategoryIds;
//   Null? productsIds;
//   List<int>? digitalProductsIds;
//   List<int>? quickProductsIds;
//   String? createdAt;
//   String? updatedAt;
//   String? name;
//   String? dis;
//   List<Translations>? translations;

//   AdsData(
//       {this.id,
//       this.image,
//       this.directedTo,
//       this.isActive,
//       this.shopsIds,
//       this.subCategoryIds,
//       this.productsIds,
//       this.digitalProductsIds,
//       this.quickProductsIds,
//       this.createdAt,
//       this.updatedAt,
//       this.name,
//       this.dis,
//       this.translations});

//   AdsData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     image = json['image'];
//     directedTo = json['directed_to'];
//     isActive = json['is_active'];
//     // shopsIds = json['shops_Ids']<int>();
//     subCategoryIds = json['sub_category_Ids'];
//     productsIds = json['products_Ids'];
//     // digitalProductsIds = json['digital_products_Ids']<int>();
//     // quickProductsIds = json['quick_products_Ids']<int>();
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     name = json['name'];
//     dis = json['dis'];
//     if (json['translations'] != null) {
//       translations = <Translations>[];
//       json['translations'].forEach((v) {
//         translations!.add(new Translations.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['image'] = this.image;
//     data['directed_to'] = this.directedTo;
//     data['is_active'] = this.isActive;
//     data['shops_Ids'] = this.shopsIds;
//     data['sub_category_Ids'] = this.subCategoryIds;
//     data['products_Ids'] = this.productsIds;
//     data['digital_products_Ids'] = this.digitalProductsIds;
//     data['quick_products_Ids'] = this.quickProductsIds;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['name'] = this.name;
//     data['dis'] = this.dis;
//     if (this.translations != null) {
//       data['translations'] = this.translations!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Translations {
//   int? id;
//   int? adId;
//   String? locale;
//   String? name;
//   String? dis;
//   Null? createdAt;
//   Null? updatedAt;

//   Translations(
//       {this.id,
//       this.adId,
//       this.locale,
//       this.name,
//       this.dis,
//       this.createdAt,
//       this.updatedAt});

//   Translations.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     adId = json['ad_id'];
//     locale = json['locale'];
//     name = json['name'];
//     dis = json['dis'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['ad_id'] = this.adId;
//     data['locale'] = this.locale;
//     data['name'] = this.name;
//     data['dis'] = this.dis;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }

class AdsModel {
  String? status;
  String? message;
  List<AdsData>? data;

  AdsModel({this.status, this.message, this.data});

  AdsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AdsData>[];
      json['data'].forEach((v) {
        data!.add(new AdsData.fromJson(v));
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

class AdsData {
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

  AdsData(
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

  AdsData.fromJson(Map<String, dynamic> json) {
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
  int? adId;
  String? locale;
  String? name;
  String? dis;
  Null? createdAt;
  Null? updatedAt;

  Translations(
      {this.id,
      this.adId,
      this.locale,
      this.name,
      this.dis,
      this.createdAt,
      this.updatedAt});

  Translations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adId = json['ad_id'];
    locale = json['locale'];
    name = json['name'];
    dis = json['dis'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ad_id'] = this.adId;
    data['locale'] = this.locale;
    data['name'] = this.name;
    data['dis'] = this.dis;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
