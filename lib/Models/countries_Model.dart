class CountriesModel {
  String? status;
  String? message;
  List<CountriesModelData>? data;

  CountriesModel({this.status, this.message, this.data});

  CountriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CountriesModelData>[];
      json['data'].forEach((v) {
        data!.add(new CountriesModelData.fromJson(v));
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

class CountriesModelData {
  int? id;
  String? name;
  int? govId;
  String? latLong;
  String? range;
  String? createdAt;
  String? updatedAt;

  CountriesModelData(
      {this.id,
      this.name,
      this.govId,
      this.latLong,
      this.range,
      this.createdAt,
      this.updatedAt});

  CountriesModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    govId = json['gov_id'];
    latLong = json['lat_long'];
    range = json['range'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['gov_id'] = this.govId;
    data['lat_long'] = this.latLong;
    data['range'] = this.range;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
