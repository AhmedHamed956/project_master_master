// // import 'model/products_data.dart';
// // import 'model/shop_model.dart';

// // class OrdersModel {
// //   String? status;
// //   String? message;
// //   List<Data>? data;

// //   OrdersModel({this.status, this.message, this.data});

// //   OrdersModel.fromJson(Map<String, dynamic> json) {
// //     status = json['status'];
// //     message = json['message'];
// //     if (json['data'] != null) {
// //       data = <Data>[];
// //       json['data'].forEach((v) {
// //         data!.add(new Data.fromJson(v));
// //       });
// //     }
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['status'] = this.status;
// //     data['message'] = this.message;
// //     if (this.data != null) {
// //       data['data'] = this.data!.map((v) => v.toJson()).toList();
// //     }
// //     return data;
// //   }
// // }

// // class Data {
// //   List<Null>? delivery;
// //   List<Progress>? progress;
// //   List<Scheduler>? scheduler;
// //   List<Null>? cancle;

// //   Data({this.delivery, this.progress, this.scheduler, this.cancle});

// //   Data.fromJson(Map<String, dynamic> json) {
// //     if (json['delivery'] != null) {
// //       delivery = <Null>[];
// //       json['delivery'].forEach((v) {
// //         // delivery!.add(new Null.fromJson(v));
// //       });
// //     }
// //     if (json['progress'] != null) {
// //       progress = <Progress>[];
// //       json['progress'].forEach((v) {
// //         progress!.add(new Progress.fromJson(v));
// //       });
// //     }
// //     if (json['scheduler'] != null) {
// //       scheduler = <Scheduler>[];
// //       json['scheduler'].forEach((v) {
// //         scheduler!.add(new Scheduler.fromJson(v));
// //       });
// //     }
// //     if (json['cancle'] != null) {
// //       cancle = <Null>[];
// //       json['cancle'].forEach((v) {
// //         // cancle!.add(new Null.fromJson(v));
// //       });
// //     }
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     if (this.delivery != null) {
// //       // data['delivery'] = this.delivery!.map((v) => v.toJson()).toList();
// //     }
// //     if (this.progress != null) {
// //       data['progress'] = this.progress!.map((v) => v.toJson()).toList();
// //     }
// //     if (this.scheduler != null) {
// //       data['scheduler'] = this.scheduler!.map((v) => v.toJson()).toList();
// //     }
// //     if (this.cancle != null) {
// //       // data['cancle'] = this.cancle!.map((v) => v.toJson()).toList();
// //     }
// //     return data;
// //   }
// // }

// // class Progress {
// //   int? id;
// //   int? userId;
// //   int? shopId;
// //   int? total;
// //   int? deliveryCost;
// //   int? totalPrice;
// //   String? status;
// //   Null? scheduler;
// //   String? createdAt;
// //   String? updatedAt;
// //   ShopData? shopData;
// //   List<Products>? products;

// //   Progress(
// //       {this.id,
// //       this.userId,
// //       this.shopId,
// //       this.total,
// //       this.deliveryCost,
// //       this.totalPrice,
// //       this.status,
// //       this.scheduler,
// //       this.createdAt,
// //       this.updatedAt,
// //       this.shopData,
// //       this.products});

// //   Progress.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     userId = json['user_id'];
// //     shopId = json['shop_id'];
// //     total = json['total'];
// //     deliveryCost = json['delivery_cost'];
// //     totalPrice = json['total_price'];
// //     status = json['status'];
// //     scheduler = json['scheduler'];
// //     createdAt = json['created_at'];
// //     updatedAt = json['updated_at'];
// //     shopData = json['shop_data'] != null
// //         ? new ShopData.fromJson(json['shop_data'])
// //         : null;
// //     if (json['products'] != null) {
// //       products = <Products>[];
// //       json['products'].forEach((v) {
// //         products!.add(new Products.fromJson(v));
// //       });
// //     }
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['id'] = this.id;
// //     data['user_id'] = this.userId;
// //     data['shop_id'] = this.shopId;
// //     data['total'] = this.total;
// //     data['delivery_cost'] = this.deliveryCost;
// //     data['total_price'] = this.totalPrice;
// //     data['status'] = this.status;
// //     data['scheduler'] = this.scheduler;
// //     data['created_at'] = this.createdAt;
// //     data['updated_at'] = this.updatedAt;
// //     if (this.shopData != null) {
// //       data['shop_data'] = this.shopData!.toJson();
// //     }
// //     if (this.products != null) {
// //       data['products'] = this.products!.map((v) => v.toJson()).toList();
// //     }
// //     return data;
// //   }
// // }

// // class Scheduler {
// //   int? id;
// //   int? userId;
// //   int? shopId;
// //   int? total;
// //   int? deliveryCost;
// //   int? totalPrice;
// //   String? status;
// //   String? scheduler;
// //   String? createdAt;
// //   String? updatedAt;
// //   ShopData? shopData;
// //   List<Products>? products;

// //   Scheduler(
// //       {this.id,
// //       this.userId,
// //       this.shopId,
// //       this.total,
// //       this.deliveryCost,
// //       this.totalPrice,
// //       this.status,
// //       this.scheduler,
// //       this.createdAt,
// //       this.updatedAt,
// //       this.shopData,
// //       this.products});

// //   Scheduler.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     userId = json['user_id'];
// //     shopId = json['shop_id'];
// //     total = json['total'];
// //     deliveryCost = json['delivery_cost'];
// //     totalPrice = json['total_price'];
// //     status = json['status'];
// //     scheduler = json['scheduler'];
// //     createdAt = json['created_at'];
// //     updatedAt = json['updated_at'];
// //     shopData = json['shop_data'] != null
// //         ? new ShopData.fromJson(json['shop_data'])
// //         : null;
// //     if (json['products'] != null) {
// //       products = <Products>[];
// //       json['products'].forEach((v) {
// //         products!.add(new Products.fromJson(v));
// //       });
// //     }
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['id'] = this.id;
// //     data['user_id'] = this.userId;
// //     data['shop_id'] = this.shopId;
// //     data['total'] = this.total;
// //     data['delivery_cost'] = this.deliveryCost;
// //     data['total_price'] = this.totalPrice;
// //     data['status'] = this.status;
// //     data['scheduler'] = this.scheduler;
// //     data['created_at'] = this.createdAt;
// //     data['updated_at'] = this.updatedAt;
// //     if (this.shopData != null) {
// //       data['shop_data'] = this.shopData!.toJson();
// //     }
// //     if (this.products != null) {
// //       data['products'] = this.products!.map((v) => v.toJson()).toList();
// //     }
// //     return data;
// //   }
// // }

// class OrdersModel {
//   String? status;
//   String? message;
//   List<Data>? data;

//   OrdersModel({this.status, this.message, this.data});

//   OrdersModel.fromJson(Map<String, dynamic> json) {
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
//   List<Null>? delivery;
//   List<Progress>? progress;
//   List<Null>? scheduler;
//   List<Cancle>? cancle;

//   Data({this.delivery, this.progress, this.scheduler, this.cancle});

//   Data.fromJson(Map<String, dynamic> json) {
//     if (json['delivery'] != null) {
//       delivery = <Null>[];
//       json['delivery'].forEach((v) {
//         // delivery!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['progress'] != null) {
//       progress = <Progress>[];
//       json['progress'].forEach((v) {
//         progress!.add(new Progress.fromJson(v));
//       });
//     }
//     if (json['scheduler'] != null) {
//       scheduler = <Null>[];
//       json['scheduler'].forEach((v) {
//         // scheduler!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['cancle'] != null) {
//       cancle = <Cancle>[];
//       json['cancle'].forEach((v) {
//         cancle!.add(new Cancle.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.delivery != null) {
//       // data['delivery'] = this.delivery!.map((v) => v.toJson()).toList();
//     }
//     if (this.progress != null) {
//       data['progress'] = this.progress!.map((v) => v.toJson()).toList();
//     }
//     if (this.scheduler != null) {
//       // data['scheduler'] = this.scheduler!.map((v) => v.toJson()).toList();
//     }
//     if (this.cancle != null) {
//       data['cancle'] = this.cancle!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Progress {
//   int? id;
//   int? userId;
//   int? shopId;
//   int? total;
//   int? deliveryCost;
//   int? totalPrice;
//   String? status;
//   String? scheduler;
//   int? isQuick;
//   String? createdAt;
//   String? updatedAt;
//   OrderShopData? shopData;
//   DeliveryDetail? deliveryDetail;
//   List<OrderProducts>? products;

//   Progress(
//       {this.id,
//       this.userId,
//       this.shopId,
//       this.total,
//       this.deliveryCost,
//       this.totalPrice,
//       this.status,
//       this.scheduler,
//       this.isQuick,
//       this.createdAt,
//       this.updatedAt,
//       this.shopData,
//       this.deliveryDetail,
//       this.products});

//   Progress.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     shopId = json['shop_id'];
//     total = json['total'];
//     deliveryCost = json['delivery_cost'];
//     totalPrice = json['total_price'];
//     status = json['status'];
//     scheduler = json['scheduler'];
//     isQuick = json['is_quick'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     shopData = json['shop_data'] != null
//         ? new OrderShopData.fromJson(json['shop_data'])
//         : null;
//     deliveryDetail = json['delivery_detail'] != null
//         ? new DeliveryDetail.fromJson(json['delivery_detail'])
//         : null;
//     if (json['products'] != null) {
//       products = <OrderProducts>[];
//       json['products'].forEach((v) {
//         products!.add(new OrderProducts.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['shop_id'] = this.shopId;
//     data['total'] = this.total;
//     data['delivery_cost'] = this.deliveryCost;
//     data['total_price'] = this.totalPrice;
//     data['status'] = this.status;
//     data['scheduler'] = this.scheduler;
//     data['is_quick'] = this.isQuick;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.shopData != null) {
//       data['shop_data'] = this.shopData!.toJson();
//     }
//     if (this.deliveryDetail != null) {
//       data['delivery_detail'] = this.deliveryDetail!.toJson();
//     }
//     if (this.products != null) {
//       data['products'] = this.products!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Scheduler {
//   int? id;
//   int? userId;
//   int? shopId;
//   int? total;
//   int? deliveryCost;
//   int? totalPrice;
//   String? status;
//   String? scheduler;
//   String? createdAt;
//   String? updatedAt;
//   OrderShopData? shopData;
//   List<OrderProducts>? products;

//   Scheduler(
//       {this.id,
//       this.userId,
//       this.shopId,
//       this.total,
//       this.deliveryCost,
//       this.totalPrice,
//       this.status,
//       this.scheduler,
//       this.createdAt,
//       this.updatedAt,
//       this.shopData,
//       this.products});

//   Scheduler.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     shopId = json['shop_id'];
//     total = json['total'];
//     deliveryCost = json['delivery_cost'];
//     totalPrice = json['total_price'];
//     status = json['status'];
//     scheduler = json['scheduler'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     shopData = json['shop_data'] != null
//         ? new OrderShopData.fromJson(json['shop_data'])
//         : null;
//     if (json['products'] != null) {
//       products = <OrderProducts>[];
//       json['products'].forEach((v) {
//         products!.add(new OrderProducts.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['shop_id'] = this.shopId;
//     data['total'] = this.total;
//     data['delivery_cost'] = this.deliveryCost;
//     data['total_price'] = this.totalPrice;
//     data['status'] = this.status;
//     data['scheduler'] = this.scheduler;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.shopData != null) {
//       data['shop_data'] = this.shopData!.toJson();
//     }
//     if (this.products != null) {
//       data['products'] = this.products!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class OrderShopData {
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

//   OrderShopData(
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

//   OrderShopData.fromJson(Map<String, dynamic> json) {
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

// class DeliveryDetail {
//   int? id;
//   int? userId;
//   int? detailOrderId;
//   int? orderId;
//   int? shopId;
//   Null? deliveryId;
//   String? map;
//   String? status;
//   int? totalPrice;
//   int? payed;
//   int? isAccpetd;
//   int? done;
//   String? typePay;
//   String? deliveryDate;
//   String? createdAt;
//   String? updatedAt;

//   DeliveryDetail(
//       {this.id,
//       this.userId,
//       this.detailOrderId,
//       this.orderId,
//       this.shopId,
//       this.deliveryId,
//       this.map,
//       this.status,
//       this.totalPrice,
//       this.payed,
//       this.isAccpetd,
//       this.done,
//       this.typePay,
//       this.deliveryDate,
//       this.createdAt,
//       this.updatedAt});

//   DeliveryDetail.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     detailOrderId = json['detail_order_id'];
//     orderId = json['order_id'];
//     shopId = json['shop_id'];
//     deliveryId = json['delivery_id'];
//     map = json['map'];
//     status = json['status'];
//     totalPrice = json['total_price'];
//     payed = json['payed'];
//     isAccpetd = json['is_accpetd'];
//     done = json['done'];
//     typePay = json['type_pay'];
//     deliveryDate = json['delivery_date'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['detail_order_id'] = this.detailOrderId;
//     data['order_id'] = this.orderId;
//     data['shop_id'] = this.shopId;
//     data['delivery_id'] = this.deliveryId;
//     data['map'] = this.map;
//     data['status'] = this.status;
//     data['total_price'] = this.totalPrice;
//     data['payed'] = this.payed;
//     data['is_accpetd'] = this.isAccpetd;
//     data['done'] = this.done;
//     data['type_pay'] = this.typePay;
//     data['delivery_date'] = this.deliveryDate;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }

// class OrderProducts {
//   int? id;
//   int? productId;
//   int? orderId;
//   int? quantity;
//   ProductsData? productsData;

//   OrderProducts(
//       {this.id,
//       this.productId,
//       this.orderId,
//       this.quantity,
//       this.productsData});

//   OrderProducts.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     productId = json['product_id'];
//     orderId = json['order_id'];
//     quantity = json['quantity'];
//     productsData = json['products_data'] != null
//         ? new ProductsData.fromJson(json['products_data'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['product_id'] = this.productId;
//     data['order_id'] = this.orderId;
//     data['quantity'] = this.quantity;
//     if (this.productsData != null) {
//       data['products_data'] = this.productsData!.toJson();
//     }
//     return data;
//   }
// }

// class ProductsData {
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
//   List<Translations>? translations;

//   ProductsData(
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
//       this.translations});

//   ProductsData.fromJson(Map<String, dynamic> json) {
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
//     if (this.translations != null) {
//       data['translations'] = this.translations!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Translations {
//   int? id;
//   int? productId;
//   String? locale;
//   String? name;
//   String? dis;
//   Null? createdAt;
//   Null? updatedAt;

//   Translations(
//       {this.id,
//       this.productId,
//       this.locale,
//       this.name,
//       this.dis,
//       this.createdAt,
//       this.updatedAt});

//   Translations.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     productId = json['product_id'];
//     locale = json['locale'];
//     name = json['name'];
//     dis = json['dis'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['product_id'] = this.productId;
//     data['locale'] = this.locale;
//     data['name'] = this.name;
//     data['dis'] = this.dis;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }

// class Cancle {
//   int? id;
//   int? userId;
//   int? shopId;
//   int? total;
//   int? deliveryCost;
//   int? totalPrice;
//   String? status;
//   Null? scheduler;
//   int? isQuick;
//   String? createdAt;
//   String? updatedAt;
//   OrderShopData? shopData;
//   List<OrderProducts>? products;

//   Cancle(
//       {this.id,
//       this.userId,
//       this.shopId,
//       this.total,
//       this.deliveryCost,
//       this.totalPrice,
//       this.status,
//       this.scheduler,
//       this.isQuick,
//       this.createdAt,
//       this.updatedAt,
//       this.shopData,
//       this.products});

//   Cancle.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     shopId = json['shop_id'];
//     total = json['total'];
//     deliveryCost = json['delivery_cost'];
//     totalPrice = json['total_price'];
//     status = json['status'];
//     scheduler = json['scheduler'];
//     isQuick = json['is_quick'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     shopData = json['shop_data'] != null
//         ? new OrderShopData.fromJson(json['shop_data'])
//         : null;
//     if (json['products'] != null) {
//       products = <OrderProducts>[];
//       json['products'].forEach((v) {
//         products!.add(new OrderProducts.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['shop_id'] = this.shopId;
//     data['total'] = this.total;
//     data['delivery_cost'] = this.deliveryCost;
//     data['total_price'] = this.totalPrice;
//     data['status'] = this.status;
//     data['scheduler'] = this.scheduler;
//     data['is_quick'] = this.isQuick;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.shopData != null) {
//       data['shop_data'] = this.shopData!.toJson();
//     }
//     if (this.products != null) {
//       data['products'] = this.products!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

class OrdersModel {
  String? status;
  String? message;
  List<Data>? data;

  OrdersModel({this.status, this.message, this.data});

  OrdersModel.fromJson(Map<String, dynamic> json) {
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
  List<Delivery>? delivery;
  List<Progress>? progress;
  List<Scheduler>? scheduler;
  List<Cancle>? cancle;

  Data({this.delivery, this.progress, this.scheduler, this.cancle});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['delivery'] != null) {
      delivery = <Delivery>[];
      json['delivery'].forEach((v) {
        delivery!.add(new Delivery.fromJson(v));
      });
    }
    if (json['progress'] != null) {
      progress = <Progress>[];
      json['progress'].forEach((v) {
        progress!.add(new Progress.fromJson(v));
      });
    }
    if (json['scheduler'] != null) {
      scheduler = <Scheduler>[];
      json['scheduler'].forEach((v) {
        scheduler!.add(new Scheduler.fromJson(v));
      });
    }
    if (json['cancle'] != null) {
      cancle = <Cancle>[];
      json['cancle'].forEach((v) {
        cancle!.add(new Cancle.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.delivery != null) {
      data['delivery'] = this.delivery!.map((v) => v.toJson()).toList();
    }
    if (this.progress != null) {
      data['progress'] = this.progress!.map((v) => v.toJson()).toList();
    }
    if (this.scheduler != null) {
      data['scheduler'] = this.scheduler!.map((v) => v.toJson()).toList();
    }
    if (this.cancle != null) {
      data['cancle'] = this.cancle!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Delivery {
  int? id;
  int? userId;
  int? shopId;
  int? total;
  int? deliveryCost;
  int? totalPrice;
  String? status;
  Null? scheduler;
  int? isQuick;
  String? createdAt;
  String? updatedAt;
  ShopDatta? shopDatta;
  DeliveryDetail? deliveryDetail;
  List<Productts>? productts;
  Rating? rating;

  Delivery(
      {this.id,
      this.userId,
      this.shopId,
      this.total,
      this.deliveryCost,
      this.totalPrice,
      this.status,
      this.scheduler,
      this.isQuick,
      this.createdAt,
      this.updatedAt,
      this.shopDatta,
      this.deliveryDetail,
      this.productts,
      this.rating});

  Delivery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    shopId = json['shop_id'];
    total = json['total'];
    deliveryCost = json['delivery_cost'];
    totalPrice = json['total_price'];
    status = json['status'];
    scheduler = json['scheduler'];
    isQuick = json['is_quick'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    shopDatta = json['shop_data'] != null
        ? new ShopDatta.fromJson(json['shop_data'])
        : null;
    deliveryDetail = json['delivery_detail'] != null
        ? new DeliveryDetail.fromJson(json['delivery_detail'])
        : null;
    if (json['products'] != null) {
      productts = <Productts>[];
      json['products'].forEach((v) {
        productts!.add(new Productts.fromJson(v));
      });
    }
    rating =
        json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['shop_id'] = this.shopId;
    data['total'] = this.total;
    data['delivery_cost'] = this.deliveryCost;
    data['total_price'] = this.totalPrice;
    data['status'] = this.status;
    data['scheduler'] = this.scheduler;
    data['is_quick'] = this.isQuick;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.shopDatta != null) {
      data['shop_data'] = this.shopDatta!.toJson();
    }
    if (this.deliveryDetail != null) {
      data['delivery_detail'] = this.deliveryDetail!.toJson();
    }
    if (this.productts != null) {
      data['products'] = this.productts!.map((v) => v.toJson()).toList();
    }
    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
    }
    return data;
  }
}

class ShopDatta {
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

  ShopDatta(
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

  ShopDatta.fromJson(Map<String, dynamic> json) {
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

class DeliveryDetail {
  int? id;
  int? userId;
  int? detailOrderId;
  int? orderId;
  int? shopId;
  int? deliveryId;
  String? map;
  String? status;
  int? totalPrice;
  int? payed;
  int? isAccpetd;
  int? done;
  String? typePay;
  String? deliveryDate;
  String? createdAt;
  String? updatedAt;
  DeliveryUserData? deliveryUserData;
  DeliveryDetail(
      {this.id,
      this.userId,
      this.detailOrderId,
      this.orderId,
      this.shopId,
      this.deliveryId,
      this.map,
      this.status,
      this.totalPrice,
      this.payed,
      this.isAccpetd,
      this.done,
      this.typePay,
      this.deliveryDate,
      this.createdAt,
      this.updatedAt,
      this.deliveryUserData});

  DeliveryDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    detailOrderId = json['detail_order_id'];
    orderId = json['order_id'];
    shopId = json['shop_id'];
    deliveryId = json['delivery_id'];
    map = json['map'];
    status = json['status'];
    totalPrice = json['total_price'];
    payed = json['payed'];
    isAccpetd = json['is_accpetd'];
    done = json['done'];
    typePay = json['type_pay'];
    deliveryDate = json['delivery_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deliveryUserData = json['delivery_user_data'] != null
        ? new DeliveryUserData.fromJson(json['delivery_user_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['detail_order_id'] = this.detailOrderId;
    data['order_id'] = this.orderId;
    data['shop_id'] = this.shopId;
    data['delivery_id'] = this.deliveryId;
    data['map'] = this.map;
    data['status'] = this.status;
    data['total_price'] = this.totalPrice;
    data['payed'] = this.payed;
    data['is_accpetd'] = this.isAccpetd;
    data['done'] = this.done;
    data['type_pay'] = this.typePay;
    data['delivery_date'] = this.deliveryDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.deliveryUserData != null) {
      data['delivery_user_data'] = this.deliveryUserData!.toJson();
    }
    return data;
  }
}

class DeliveryUserData {
  int? id;
  String? name;
  String? email;
  String? userName;
  String? phone;
  Null? emailVerifiedAt;
  int? isAdmin;
  int? isInvestor;
  int? isRepresentative;
  int? isClient;
  int? isOnline;
  String? avatar;
  Null? map;
  String? createdAt;
  String? updatedAt;
  String? lastActivity;

  DeliveryUserData(
      {this.id,
      this.name,
      this.email,
      this.userName,
      this.phone,
      this.emailVerifiedAt,
      this.isAdmin,
      this.isInvestor,
      this.isRepresentative,
      this.isClient,
      this.isOnline,
      this.avatar,
      this.map,
      this.createdAt,
      this.updatedAt,
      this.lastActivity});

  DeliveryUserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    userName = json['user_name'];
    phone = json['phone'];
    emailVerifiedAt = json['email_verified_at'];
    isAdmin = json['is_admin'];
    isInvestor = json['is_investor'];
    isRepresentative = json['is_representative'];
    isClient = json['is_client'];
    isOnline = json['is_online'];
    avatar = json['avatar'];
    map = json['map'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    lastActivity = json['last_activity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['user_name'] = this.userName;
    data['phone'] = this.phone;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['is_admin'] = this.isAdmin;
    data['is_investor'] = this.isInvestor;
    data['is_representative'] = this.isRepresentative;
    data['is_client'] = this.isClient;
    data['is_online'] = this.isOnline;
    data['avatar'] = this.avatar;
    data['map'] = this.map;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['last_activity'] = this.lastActivity;
    return data;
  }
}

class Productts {
  int? id;
  int? productId;
  int? orderId;
  int? quantity;
  ProductsDatta? productsDatta;

  Productts(
      {this.id,
      this.productId,
      this.orderId,
      this.quantity,
      this.productsDatta});

  Productts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    orderId = json['order_id'];
    quantity = json['quantity'];
    productsDatta = json['products_data'] != null
        ? new ProductsDatta.fromJson(json['products_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['order_id'] = this.orderId;
    data['quantity'] = this.quantity;
    if (this.productsDatta != null) {
      data['products_data'] = this.productsDatta!.toJson();
    }
    return data;
  }
}

class ProductsDatta {
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

  ProductsDatta(
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

  ProductsDatta.fromJson(Map<String, dynamic> json) {
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

class Rating {
  int? id;
  int? orderId;
  int? shopId;
  int? userId;
  String? rating;
  String? note;
  String? createdAt;
  String? updatedAt;

  Rating(
      {this.id,
      this.orderId,
      this.shopId,
      this.userId,
      this.rating,
      this.note,
      this.createdAt,
      this.updatedAt});

  Rating.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    shopId = json['shop_id'];
    userId = json['user_id'];
    rating = json['rating'];
    note = json['note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['shop_id'] = this.shopId;
    data['user_id'] = this.userId;
    data['rating'] = this.rating;
    data['note'] = this.note;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Progress {
  int? id;
  int? userId;
  int? shopId;
  int? total;
  int? deliveryCost;
  int? totalPrice;
  String? status;
  Null? scheduler;
  int? isQuick;
  String? createdAt;
  String? updatedAt;
  ShopDatta? shopDatta;
  DeliveryDetail? deliveryDetail;
  List<Productts>? products;

  Progress(
      {this.id,
      this.userId,
      this.shopId,
      this.total,
      this.deliveryCost,
      this.totalPrice,
      this.status,
      this.scheduler,
      this.isQuick,
      this.createdAt,
      this.updatedAt,
      this.shopDatta,
      this.deliveryDetail,
      this.products});

  Progress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    shopId = json['shop_id'];
    total = json['total'];
    deliveryCost = json['delivery_cost'];
    totalPrice = json['total_price'];
    status = json['status'];
    scheduler = json['scheduler'];
    isQuick = json['is_quick'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    shopDatta = json['shop_data'] != null
        ? new ShopDatta.fromJson(json['shop_data'])
        : null;
    deliveryDetail = json['delivery_detail'] != null
        ? new DeliveryDetail.fromJson(json['delivery_detail'])
        : null;
    if (json['products'] != null) {
      products = <Productts>[];
      json['products'].forEach((v) {
        products!.add(new Productts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['shop_id'] = this.shopId;
    data['total'] = this.total;
    data['delivery_cost'] = this.deliveryCost;
    data['total_price'] = this.totalPrice;
    data['status'] = this.status;
    data['scheduler'] = this.scheduler;
    data['is_quick'] = this.isQuick;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.shopDatta != null) {
      data['shop_data'] = this.shopDatta!.toJson();
    }
    if (this.deliveryDetail != null) {
      data['delivery_detail'] = this.deliveryDetail!.toJson();
    }
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Scheduler {
  int? id;
  int? userId;
  int? shopId;
  int? total;
  int? deliveryCost;
  int? totalPrice;
  String? status;
  String? scheduler;
  int? isQuick;
  String? createdAt;
  String? updatedAt;
  ShopDatta? shopDatta;
  List<Productts>? products;

  Scheduler(
      {this.id,
      this.userId,
      this.shopId,
      this.total,
      this.deliveryCost,
      this.totalPrice,
      this.status,
      this.scheduler,
      this.isQuick,
      this.createdAt,
      this.updatedAt,
      this.shopDatta,
      this.products});

  Scheduler.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    shopId = json['shop_id'];
    total = json['total'];
    deliveryCost = json['delivery_cost'];
    totalPrice = json['total_price'];
    status = json['status'];
    scheduler = json['scheduler'];
    isQuick = json['is_quick'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    shopDatta = json['shop_data'] != null
        ? new ShopDatta.fromJson(json['shop_data'])
        : null;
    if (json['products'] != null) {
      products = <Productts>[];
      json['products'].forEach((v) {
        products!.add(new Productts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['shop_id'] = this.shopId;
    data['total'] = this.total;
    data['delivery_cost'] = this.deliveryCost;
    data['total_price'] = this.totalPrice;
    data['status'] = this.status;
    data['scheduler'] = this.scheduler;
    data['is_quick'] = this.isQuick;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.shopDatta != null) {
      data['shop_data'] = this.shopDatta!.toJson();
    }
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cancle {
  int? id;
  int? userId;
  int? shopId;
  int? total;
  int? deliveryCost;
  int? totalPrice;
  String? status;
  Null? scheduler;
  int? isQuick;
  String? createdAt;
  String? updatedAt;
  ShopDatta? shopDatta;
  List<Productts>? products;

  Cancle(
      {this.id,
      this.userId,
      this.shopId,
      this.total,
      this.deliveryCost,
      this.totalPrice,
      this.status,
      this.scheduler,
      this.isQuick,
      this.createdAt,
      this.updatedAt,
      this.shopDatta,
      this.products});

  Cancle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    shopId = json['shop_id'];
    total = json['total'];
    deliveryCost = json['delivery_cost'];
    totalPrice = json['total_price'];
    status = json['status'];
    // scheduler = json['scheduler'];
    isQuick = json['is_quick'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    shopDatta = json['shop_data'] != null
        ? new ShopDatta.fromJson(json['shop_data'])
        : null;
    if (json['products'] != null) {
      products = <Productts>[];
      json['products'].forEach((v) {
        products!.add(new Productts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['shop_id'] = this.shopId;
    data['total'] = this.total;
    data['delivery_cost'] = this.deliveryCost;
    data['total_price'] = this.totalPrice;
    data['status'] = this.status;
    data['scheduler'] = this.scheduler;
    data['is_quick'] = this.isQuick;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.shopDatta != null) {
      data['shop_data'] = this.shopDatta!.toJson();
    }
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
