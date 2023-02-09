import 'package:project/Models/model/order_model.dart';

class OrdersResponse {
  String? status;
  String? message;
  List<Data>? data;

  OrdersResponse({this.status, this.message, this.data});

  OrdersResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  List<OrderModel>? delivery;
  List<OrderModel>? progress;
  List<OrderModel>? scheduler;
  List<OrderModel>? cancle;

  Data({this.delivery, this.progress, this.scheduler, this.cancle});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['delivery'] != null) {
      delivery = <OrderModel>[];
      json['delivery'].forEach((v) {
        delivery!.add(OrderModel.fromJson(v));
      });
    }
    if (json['progress'] != null) {
      progress = <OrderModel>[];
      json['progress'].forEach((v) {
        progress!.add(OrderModel.fromJson(v));
      });
    }
    if (json['scheduler'] != null) {
      scheduler = <OrderModel>[];
      json['scheduler'].forEach((v) {
        scheduler!.add(OrderModel.fromJson(v));
      });
    }
    if (json['cancle'] != null) {
      cancle = <OrderModel>[];
      json['cancle'].forEach((v) {
        cancle!.add(OrderModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (delivery != null) {
      data['delivery'] = delivery!.map((v) => v.toJson()).toList();
    }
    if (progress != null) {
      data['progress'] = progress!.map((v) => v.toJson()).toList();
    }
    if (scheduler != null) {
      data['scheduler'] = scheduler!.map((v) => v.toJson()).toList();
    }
    if (cancle != null) {
      data['cancle'] = cancle!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
