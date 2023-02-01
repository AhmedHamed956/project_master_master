class ClientTrakingOrderModel {
  String? status;
  Message? message;
  ClientTrakingOrderData? data;

  ClientTrakingOrderModel({this.status, this.message, this.data});

  ClientTrakingOrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message =
        json['message'] != null ? new Message.fromJson(json['message']) : null;
    data = json['data'] != null
        ? new ClientTrakingOrderData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Message {
  String? dateOrder;
  bool? searchDelivery;
  bool? orderProgress;
  bool? orderInWay;
  bool? isDone;
  String? deliveryName;
  String? luctionName;
  String? mobile;

  Message(
      {this.dateOrder,
      this.searchDelivery,
      this.orderProgress,
      this.orderInWay,
      this.isDone,
      this.deliveryName,
      this.luctionName,
      this.mobile});

  Message.fromJson(Map<String, dynamic> json) {
    dateOrder = json['date_order'];
    searchDelivery = json['search_Delivery'];
    orderProgress = json['order_progress'];
    orderInWay = json['order_in_way'];
    isDone = json['is_done'];
    deliveryName = json['Delivery_name'];
    luctionName = json['luction_name'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date_order'] = this.dateOrder;
    data['search_Delivery'] = this.searchDelivery;
    data['order_progress'] = this.orderProgress;
    data['order_in_way'] = this.orderInWay;
    data['is_done'] = this.isDone;
    data['Delivery_name'] = this.deliveryName;
    data['luction_name'] = this.luctionName;
    data['mobile'] = this.mobile;
    return data;
  }
}

class ClientTrakingOrderData {
  int? id;
  int? userId;
  int? shopId;
  int? total;
  int? deliveryCost;
  int? totalPrice;
  String? status;
  Null? scheduler;
  String? createdAt;
  String? updatedAt;
  List<Products>? products;
  ShopData? shopData;
  OrderDetail? orderDetail;

  ClientTrakingOrderData(
      {this.id,
      this.userId,
      this.shopId,
      this.total,
      this.deliveryCost,
      this.totalPrice,
      this.status,
      this.scheduler,
      this.createdAt,
      this.updatedAt,
      this.products,
      this.shopData,
      this.orderDetail});

  ClientTrakingOrderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    shopId = json['shop_id'];
    total = json['total'];
    deliveryCost = json['delivery_cost'];
    totalPrice = json['total_price'];
    status = json['status'];
    scheduler = json['scheduler'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    shopData = json['shop_data'] != null
        ? new ShopData.fromJson(json['shop_data'])
        : null;
    orderDetail = json['order_detail'] != null
        ? new OrderDetail.fromJson(json['order_detail'])
        : null;
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
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.shopData != null) {
      data['shop_data'] = this.shopData!.toJson();
    }
    if (this.orderDetail != null) {
      data['order_detail'] = this.orderDetail!.toJson();
    }
    return data;
  }
}

class Products {
  int? id;
  int? productId;
  int? orderId;
  int? quantity;
  ProductsData? productsData;

  Products(
      {this.id,
      this.productId,
      this.orderId,
      this.quantity,
      this.productsData});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    orderId = json['order_id'];
    quantity = json['quantity'];
    productsData = json['products_data'] != null
        ? new ProductsData.fromJson(json['products_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['order_id'] = this.orderId;
    data['quantity'] = this.quantity;
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

class ShopData {
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

  ShopData(
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

  ShopData.fromJson(Map<String, dynamic> json) {
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

class OrderDetail {
  int? id;
  String? name;
  String? phone;
  int? total;
  String? typePay;
  String? typeSend;
  String? map;
  String? status;
  int? orderId;
  int? shopId;
  int? payed;
  int? userId;
  String? createdAt;
  String? updatedAt;

  OrderDetail(
      {this.id,
      this.name,
      this.phone,
      this.total,
      this.typePay,
      this.typeSend,
      this.map,
      this.status,
      this.orderId,
      this.shopId,
      this.payed,
      this.userId,
      this.createdAt,
      this.updatedAt});

  OrderDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    total = json['total'];
    typePay = json['type_pay'];
    typeSend = json['type_send'];
    map = json['map'];
    status = json['status'];
    orderId = json['order_id'];
    shopId = json['shop_id'];
    payed = json['payed'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['total'] = this.total;
    data['type_pay'] = this.typePay;
    data['type_send'] = this.typeSend;
    data['map'] = this.map;
    data['status'] = this.status;
    data['order_id'] = this.orderId;
    data['shop_id'] = this.shopId;
    data['payed'] = this.payed;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
