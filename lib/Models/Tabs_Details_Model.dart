// class TabsDetailsModel {
//   String? status;
//   String? message;
//   List<Data>? data;

//   TabsDetailsModel({this.status, this.message, this.data});

//   TabsDetailsModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
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

// class Data {
//   int? id;
//   String? createdAt;
//   String? updatedAt;
//   String? name;
//   List<SameSubCategoryProducts>? sameSubCategoryProducts;
//   List<Translations>? translations;

//   Data(
//       {this.id,
//       this.createdAt,
//       this.updatedAt,
//       this.name,
//       this.sameSubCategoryProducts,
//       this.translations});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     name = json['name'];
//     if (json['same_sub_category_products'] != null) {
//       sameSubCategoryProducts = <SameSubCategoryProducts>[];
//       json['same_sub_category_products'].forEach((v) {
//         sameSubCategoryProducts!.add(new SameSubCategoryProducts.fromJson(v));
//       });
//     }
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
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['name'] = this.name;
//     if (this.sameSubCategoryProducts != null) {
//       data['same_sub_category_products'] =
//           this.sameSubCategoryProducts!.map((v) => v.toJson()).toList();
//     }
//     if (this.translations != null) {
//       data['translations'] = this.translations!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class SameSubCategoryProducts {
//   int? id;
//   int? subCategoryId;
//   int? shopId;
//   String? price;
//   String? priceAfterDiscount;
//   int? consigneeId;
//   int? occasionId;
//   String? masterImage;
//   String? subImages;
//   int? isQuick;
//   int? isAvailable;
//   int? isShow;
//   String? createdAt;
//   String? updatedAt;
//   String? name;
//   String? dis;
//   ProductQuick? productQuick;
//   List<Translations>? translations;

//   SameSubCategoryProducts(
//       {this.id,
//       this.subCategoryId,
//       this.shopId,
//       this.price,
//       this.priceAfterDiscount,
//       this.consigneeId,
//       this.occasionId,
//       this.masterImage,
//       this.subImages,
//       this.isQuick,
//       this.isAvailable,
//       this.isShow,
//       this.createdAt,
//       this.updatedAt,
//       this.name,
//       this.dis,
//       this.productQuick,
//       this.translations});

//   SameSubCategoryProducts.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     subCategoryId = json['sub_category_id'];
//     shopId = json['shop_id'];
//     price = json['price'];
//     priceAfterDiscount = json['price_after_discount'];
//     consigneeId = json['consignee_id'];
//     occasionId = json['occasion_id'];
//     masterImage = json['master_image'];
//     subImages = json['sub_images'];
//     isQuick = json['is_quick'];
//     isAvailable = json['is_available'];
//     isShow = json['is_show'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     name = json['name'];
//     dis = json['dis'];
//     productQuick = json['product_quick'] != null
//         ? new ProductQuick.fromJson(json['product_quick'])
//         : null;
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
//     data['sub_category_id'] = this.subCategoryId;
//     data['shop_id'] = this.shopId;
//     data['price'] = this.price;
//     data['price_after_discount'] = this.priceAfterDiscount;
//     data['consignee_id'] = this.consigneeId;
//     data['occasion_id'] = this.occasionId;
//     data['master_image'] = this.masterImage;
//     data['sub_images'] = this.subImages;
//     data['is_quick'] = this.isQuick;
//     data['is_available'] = this.isAvailable;
//     data['is_show'] = this.isShow;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['name'] = this.name;
//     data['dis'] = this.dis;
//     if (this.productQuick != null) {
//       data['product_quick'] = this.productQuick!.toJson();
//     }
//     if (this.translations != null) {
//       data['translations'] = this.translations!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class ProductQuick {
//   int? id;
//   int? productId;
//   int? subCategoryId;
//   int? shopId;
//   String? price;
//   String? priceAfterDiscount;
//   int? consigneeId;
//   int? occasionId;
//   String? masterImage;
//   String? subImages;
//   int? isQuick;
//   int? isShow;
//   int? isAvailable;
//   List<String>? suggestIds;
//   String? createdAt;
//   String? updatedAt;
//   String? name;
//   QuicqShopData? quicqShopData;
//   String? dis;

//   List<Translations>? translations;

//   ProductQuick(
//       {this.id,
//       this.productId,
//       this.subCategoryId,
//       this.shopId,
//       this.price,
//       this.priceAfterDiscount,
//       this.consigneeId,
//       this.occasionId,
//       this.masterImage,
//       this.subImages,
//       this.isQuick,
//       this.isShow,
//       this.isAvailable,
//       this.suggestIds,
//       this.createdAt,
//       this.updatedAt,
//       this.name,
//       this.dis,
//       this.quicqShopData,
//       this.translations});

//   ProductQuick.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     productId = json['product_id'];
//     subCategoryId = json['sub_category_id'];
//     shopId = json['shop_id'];
//     price = json['price'];
//     priceAfterDiscount = json['price_after_discount'];
//     consigneeId = json['consignee_id'];
//     occasionId = json['occasion_id'];
//     masterImage = json['master_image'];
//     subImages = json['sub_images'];
//     isQuick = json['is_quick'];
//     isShow = json['is_show'];
//     isAvailable = json['is_available'];
//     // suggestIds = json['suggest_Ids'].cast<String>();
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     name = json['name'];
//     dis = json['dis'];
//     QuicqShopData = json['shop_data'] != null
//         ? new QuicqShopData.fromJson(json['shop_data'])
//         : null;
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
//     data['product_id'] = this.productId;
//     data['sub_category_id'] = this.subCategoryId;
//     data['shop_id'] = this.shopId;
//     data['price'] = this.price;
//     data['price_after_discount'] = this.priceAfterDiscount;
//     data['consignee_id'] = this.consigneeId;
//     data['occasion_id'] = this.occasionId;
//     data['master_image'] = this.masterImage;
//     data['sub_images'] = this.subImages;
//     data['is_quick'] = this.isQuick;
//     data['is_show'] = this.isShow;
//     data['is_available'] = this.isAvailable;
//     data['suggest_Ids'] = this.suggestIds;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['name'] = this.name;
//     data['dis'] = this.dis;
//     if (this.QuicqShopData != null) {
//       data['shop_data'] = this.QuicqShopData!.toJson();
//     }
//     if (this.translations != null) {
//       data['translations'] = this.translations!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class QuicqShopData {
//   int? id;
//   int? userId;
//   String? logo;
//   String? background;
//   String? storeName;
//   String? cRN;
//   String? brandName;
//   String? region;
//   String? city;
//   String? phone;
//   String? email;
//   String? name;
//   String? contractStatus;
//   int? numberEmployees;
//   int? isTaxable;
//   String? taxNumber;
//   String? minimumOrder;
//   String? deliveryTime;
//   String? deliveryCost;
//   String? location;
//   String? latLong;
//   int? quickSubscriber;
//   int? fromHour;
//   int? toHour;
//   String? commissionRate;
//   String? contractStartingDate;
//   String? contractEndDate;
//   String? shopCategory;
//   String? numberBranches;
//   String? normalNotes;
//   Null? statusChangeNotes;
//   String? contractFile;
//   String? commercialRegisterFile;
//   String? createdAt;
//   String? updatedAt;

//   QuicqShopData(
//       {this.id,
//       this.userId,
//       this.logo,
//       this.background,
//       this.storeName,
//       this.cRN,
//       this.brandName,
//       this.region,
//       this.city,
//       this.phone,
//       this.email,
//       this.name,
//       this.contractStatus,
//       this.numberEmployees,
//       this.isTaxable,
//       this.taxNumber,
//       this.minimumOrder,
//       this.deliveryTime,
//       this.deliveryCost,
//       this.location,
//       this.latLong,
//       this.quickSubscriber,
//       this.fromHour,
//       this.toHour,
//       this.commissionRate,
//       this.contractStartingDate,
//       this.contractEndDate,
//       this.shopCategory,
//       this.numberBranches,
//       this.normalNotes,
//       this.statusChangeNotes,
//       this.contractFile,
//       this.commercialRegisterFile,
//       this.createdAt,
//       this.updatedAt});

//   QuicqShopData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     logo = json['logo'];
//     background = json['background'];
//     storeName = json['store_name'];
//     cRN = json['CRN'];
//     brandName = json['brand_name'];
//     region = json['region'];
//     city = json['city'];
//     phone = json['phone'];
//     email = json['email'];
//     name = json['name'];
//     contractStatus = json['contract_status'];
//     numberEmployees = json['number_employees'];
//     isTaxable = json['is_taxable'];
//     taxNumber = json['tax_number'];
//     minimumOrder = json['minimum_order'];
//     deliveryTime = json['delivery_time'];
//     deliveryCost = json['delivery_cost'];
//     location = json['location'];
//     latLong = json['lat_long'];
//     quickSubscriber = json['quick_subscriber'];
//     fromHour = json['from_hour'];
//     toHour = json['to_hour'];
//     commissionRate = json['commission_rate'];
//     contractStartingDate = json['contract_starting_date'];
//     contractEndDate = json['contract_end_date'];
//     shopCategory = json['shop_category'];
//     numberBranches = json['number_branches'];
//     normalNotes = json['normal_notes'];
//     statusChangeNotes = json['status_change_notes'];
//     contractFile = json['contract_file'];
//     commercialRegisterFile = json['commercial_register_file'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['logo'] = this.logo;
//     data['background'] = this.background;
//     data['store_name'] = this.storeName;
//     data['CRN'] = this.cRN;
//     data['brand_name'] = this.brandName;
//     data['region'] = this.region;
//     data['city'] = this.city;
//     data['phone'] = this.phone;
//     data['email'] = this.email;
//     data['name'] = this.name;
//     data['contract_status'] = this.contractStatus;
//     data['number_employees'] = this.numberEmployees;
//     data['is_taxable'] = this.isTaxable;
//     data['tax_number'] = this.taxNumber;
//     data['minimum_order'] = this.minimumOrder;
//     data['delivery_time'] = this.deliveryTime;
//     data['delivery_cost'] = this.deliveryCost;
//     data['location'] = this.location;
//     data['lat_long'] = this.latLong;
//     data['quick_subscriber'] = this.quickSubscriber;
//     data['from_hour'] = this.fromHour;
//     data['to_hour'] = this.toHour;
//     data['commission_rate'] = this.commissionRate;
//     data['contract_starting_date'] = this.contractStartingDate;
//     data['contract_end_date'] = this.contractEndDate;
//     data['shop_category'] = this.shopCategory;
//     data['number_branches'] = this.numberBranches;
//     data['normal_notes'] = this.normalNotes;
//     data['status_change_notes'] = this.statusChangeNotes;
//     data['contract_file'] = this.contractFile;
//     data['commercial_register_file'] = this.commercialRegisterFile;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }

// class Translations {
//   int? id;
//   int? quickProductId;
//   String? locale;
//   String? name;
//   String? dis;
//   Null? createdAt;
//   Null? updatedAt;

//   Translations(
//       {this.id,
//       this.quickProductId,
//       this.locale,
//       this.name,
//       this.dis,
//       this.createdAt,
//       this.updatedAt});

//   Translations.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     quickProductId = json['quick_product_id'];
//     locale = json['locale'];
//     name = json['name'];
//     dis = json['dis'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['quick_product_id'] = this.quickProductId;
//     data['locale'] = this.locale;
//     data['name'] = this.name;
//     data['dis'] = this.dis;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
// // class Translations {
// //   int? id;
// //   int? quickProductId;
// //   String? locale;
// //   String? name;
// //   String? dis;
// //   Null? createdAt;
// //   Null? updatedAt;

// //   Translations(
// //       {this.id,
// //       this.quickProductId,
// //       this.locale,
// //       this.name,
// //       this.dis,
// //       this.createdAt,
// //       this.updatedAt});

// //   Translations.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     quickProductId = json['quick_product_id'];
// //     locale = json['locale'];
// //     name = json['name'];
// //     dis = json['dis'];
// //     createdAt = json['created_at'];
// //     updatedAt = json['updated_at'];
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['id'] = this.id;
// //     data['quick_product_id'] = this.quickProductId;
// //     data['locale'] = this.locale;
// //     data['name'] = this.name;
// //     data['dis'] = this.dis;
// //     data['created_at'] = this.createdAt;
// //     data['updated_at'] = this.updatedAt;
// //     return data;
// //   }
// // }

// // class Translations {
// //   int? id;
// //   int? productId;
// //   String? locale;
// //   String? name;
// //   String? dis;
// //   Null? createdAt;
// //   Null? updatedAt;

// //   Translations(
// //       {this.id,
// //       this.productId,
// //       this.locale,
// //       this.name,
// //       this.dis,
// //       this.createdAt,
// //       this.updatedAt});

// //   Translations.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     productId = json['product_id'];
// //     locale = json['locale'];
// //     name = json['name'];
// //     dis = json['dis'];
// //     createdAt = json['created_at'];
// //     updatedAt = json['updated_at'];
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['id'] = this.id;
// //     data['product_id'] = this.productId;
// //     data['locale'] = this.locale;
// //     data['name'] = this.name;
// //     data['dis'] = this.dis;
// //     data['created_at'] = this.createdAt;
// //     data['updated_at'] = this.updatedAt;
// //     return data;
// //   }
// // }

class TabsDetailsModel {
  String? status;
  String? message;
  List<Data>? data;

  TabsDetailsModel({this.status, this.message, this.data});

  TabsDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  List<SameSubCategoryProducts>? sameSubCategoryProducts;
  List<Translations>? translations;

  Data(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.sameSubCategoryProducts,
      this.translations});

  Data.fromJson(Map<String, dynamic> json) {
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
      translations = <Translations>[];
      json['translations'].forEach((v) {
        translations!.add(new Translations.fromJson(v));
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
  ProductQuick? productQuick;
  List<Translations>? translations;

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
      this.productQuick,
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
    productQuick = json['product_quick'] != null
        ? new ProductQuick.fromJson(json['product_quick'])
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
    if (this.productQuick != null) {
      data['product_quick'] = this.productQuick!.toJson();
    }
    if (this.translations != null) {
      data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductQuick {
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
  ShopDataa? shopDataa;
  List<Translations>? translations;

  ProductQuick(
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
      this.shopDataa,
      this.translations});

  ProductQuick.fromJson(Map<String, dynamic> json) {
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
    // suggestIds = json['suggest_Ids'].cast<String>();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    dis = json['dis'];
    shopDataa = json['shop_data'] != null
        ? new ShopDataa.fromJson(json['shop_data'])
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
    if (this.shopDataa != null) {
      data['shop_data'] = this.shopDataa!.toJson();
    }
    if (this.translations != null) {
      data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShopDataa {
  int? id;
  int? userId;
  String? logo;
  String? background;
  String? storeName;
  String? cRN;
  String? brandName;
  String? region;
  String? city;
  String? phone;
  String? email;
  String? name;
  String? contractStatus;
  int? numberEmployees;
  int? isTaxable;
  String? taxNumber;
  String? minimumOrder;
  String? deliveryTime;
  String? deliveryCost;
  String? location;
  String? latLong;
  int? quickSubscriber;
  int? fromHour;
  int? toHour;
  String? commissionRate;
  String? contractStartingDate;
  String? contractEndDate;
  String? shopCategory;
  String? numberBranches;
  String? normalNotes;
  Null? statusChangeNotes;
  String? contractFile;
  String? commercialRegisterFile;
  String? createdAt;
  String? updatedAt;

  ShopDataa(
      {this.id,
      this.userId,
      this.logo,
      this.background,
      this.storeName,
      this.cRN,
      this.brandName,
      this.region,
      this.city,
      this.phone,
      this.email,
      this.name,
      this.contractStatus,
      this.numberEmployees,
      this.isTaxable,
      this.taxNumber,
      this.minimumOrder,
      this.deliveryTime,
      this.deliveryCost,
      this.location,
      this.latLong,
      this.quickSubscriber,
      this.fromHour,
      this.toHour,
      this.commissionRate,
      this.contractStartingDate,
      this.contractEndDate,
      this.shopCategory,
      this.numberBranches,
      this.normalNotes,
      this.statusChangeNotes,
      this.contractFile,
      this.commercialRegisterFile,
      this.createdAt,
      this.updatedAt});

  ShopDataa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    logo = json['logo'];
    background = json['background'];
    storeName = json['store_name'];
    cRN = json['CRN'];
    brandName = json['brand_name'];
    region = json['region'];
    city = json['city'];
    phone = json['phone'];
    email = json['email'];
    name = json['name'];
    contractStatus = json['contract_status'];
    numberEmployees = json['number_employees'];
    isTaxable = json['is_taxable'];
    taxNumber = json['tax_number'];
    minimumOrder = json['minimum_order'];
    deliveryTime = json['delivery_time'];
    deliveryCost = json['delivery_cost'];
    location = json['location'];
    latLong = json['lat_long'];
    quickSubscriber = json['quick_subscriber'];
    fromHour = json['from_hour'];
    toHour = json['to_hour'];
    commissionRate = json['commission_rate'];
    contractStartingDate = json['contract_starting_date'];
    contractEndDate = json['contract_end_date'];
    shopCategory = json['shop_category'];
    numberBranches = json['number_branches'];
    normalNotes = json['normal_notes'];
    statusChangeNotes = json['status_change_notes'];
    contractFile = json['contract_file'];
    commercialRegisterFile = json['commercial_register_file'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['logo'] = this.logo;
    data['background'] = this.background;
    data['store_name'] = this.storeName;
    data['CRN'] = this.cRN;
    data['brand_name'] = this.brandName;
    data['region'] = this.region;
    data['city'] = this.city;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['name'] = this.name;
    data['contract_status'] = this.contractStatus;
    data['number_employees'] = this.numberEmployees;
    data['is_taxable'] = this.isTaxable;
    data['tax_number'] = this.taxNumber;
    data['minimum_order'] = this.minimumOrder;
    data['delivery_time'] = this.deliveryTime;
    data['delivery_cost'] = this.deliveryCost;
    data['location'] = this.location;
    data['lat_long'] = this.latLong;
    data['quick_subscriber'] = this.quickSubscriber;
    data['from_hour'] = this.fromHour;
    data['to_hour'] = this.toHour;
    data['commission_rate'] = this.commissionRate;
    data['contract_starting_date'] = this.contractStartingDate;
    data['contract_end_date'] = this.contractEndDate;
    data['shop_category'] = this.shopCategory;
    data['number_branches'] = this.numberBranches;
    data['normal_notes'] = this.normalNotes;
    data['status_change_notes'] = this.statusChangeNotes;
    data['contract_file'] = this.contractFile;
    data['commercial_register_file'] = this.commercialRegisterFile;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Translations {
  int? id;
  int? quickProductId;
  String? locale;
  String? name;
  String? dis;
  Null? createdAt;
  Null? updatedAt;

  Translations(
      {this.id,
      this.quickProductId,
      this.locale,
      this.name,
      this.dis,
      this.createdAt,
      this.updatedAt});

  Translations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quickProductId = json['quick_product_id'];
    locale = json['locale'];
    name = json['name'];
    dis = json['dis'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quick_product_id'] = this.quickProductId;
    data['locale'] = this.locale;
    data['name'] = this.name;
    data['dis'] = this.dis;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
