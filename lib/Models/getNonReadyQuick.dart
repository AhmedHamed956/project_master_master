class GetnonReadyQuickModel {
  String? status;
  int? message;
  List<GetnonReadyQuickData>? data;

  GetnonReadyQuickModel({this.status, this.message, this.data});

  GetnonReadyQuickModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetnonReadyQuickData>[];
      json['data'].forEach((v) {
        data!.add(new GetnonReadyQuickData.fromJson(v));
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

class GetnonReadyQuickData {
  int? id;
  int? productId;
  int? userId;
  int? shopId;
  int? toMe;
  int? isAccpet;
  int? quantity;
  String? createdAt;
  String? updatedAt;

  GetnonReadyQuickData(
      {this.id,
      this.productId,
      this.userId,
      this.shopId,
      this.toMe,
      this.isAccpet,
      this.quantity,
      this.createdAt,
      this.updatedAt});

  GetnonReadyQuickData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    userId = json['user_id'];
    shopId = json['shop_id'];
    toMe = json['to_me'];
    isAccpet = json['is_accpet'];
    quantity = json['quantity'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['user_id'] = this.userId;
    data['shop_id'] = this.shopId;
    data['to_me'] = this.toMe;
    data['is_accpet'] = this.isAccpet;
    data['quantity'] = this.quantity;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
