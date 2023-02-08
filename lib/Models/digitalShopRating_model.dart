class DigitalShopRatingModel {
  String? status;
  String? message;
  DigitalShopRatingModelData? data;

  DigitalShopRatingModel({this.status, this.message, this.data});

  DigitalShopRatingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? DigitalShopRatingModelData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DigitalShopRatingModelData {
  String? shopName;
  String? image;
  String? activity;
  double? rating;

  DigitalShopRatingModelData(
      {this.shopName, this.image, this.activity, this.rating});

  DigitalShopRatingModelData.fromJson(Map<String, dynamic> json) {
    shopName = json['shop_name'];
    image = json['image'];
    activity = json['activity'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shop_name'] = this.shopName;
    data['image'] = this.image;
    data['activity'] = this.activity;
    data['rating'] = this.rating;
    return data;
  }
}
