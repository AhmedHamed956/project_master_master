
import 'model/products_data.dart';
import 'model/shop_model.dart';

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
  List<Null>? delivery;
  List<Progress>? progress;
  List<Scheduler>? scheduler;
  List<Null>? cancle;

  Data({this.delivery, this.progress, this.scheduler, this.cancle});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['delivery'] != null) {
      delivery = <Null>[];
      json['delivery'].forEach((v) {
        // delivery!.add(new Null.fromJson(v));
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
      cancle = <Null>[];
      json['cancle'].forEach((v) {
        // cancle!.add(new Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.delivery != null) {
      // data['delivery'] = this.delivery!.map((v) => v.toJson()).toList();
    }
    if (this.progress != null) {
      data['progress'] = this.progress!.map((v) => v.toJson()).toList();
    }
    if (this.scheduler != null) {
      data['scheduler'] = this.scheduler!.map((v) => v.toJson()).toList();
    }
    if (this.cancle != null) {
      // data['cancle'] = this.cancle!.map((v) => v.toJson()).toList();
    }
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
  String? createdAt;
  String? updatedAt;
  ShopData? shopData;
  List<Products>? products;

  Progress(
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
      this.shopData,
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
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    shopData = json['shop_data'] != null
        ? new ShopData.fromJson(json['shop_data'])
        : null;
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
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
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.shopData != null) {
      data['shop_data'] = this.shopData!.toJson();
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
  String? createdAt;
  String? updatedAt;
  ShopData? shopData;
  List<Products>? products;

  Scheduler(
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
      this.shopData,
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
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    shopData = json['shop_data'] != null
        ? new ShopData.fromJson(json['shop_data'])
        : null;
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
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
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.shopData != null) {
      data['shop_data'] = this.shopData!.toJson();
    }
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
