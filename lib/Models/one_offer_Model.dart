class OneOffersModel {
  String? status;
  String? message;
  List<OneOfferData>? data;

  OneOffersModel({this.status, this.message, this.data});

  OneOffersModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <OneOfferData>[];
      json['data'].forEach((v) {
        data!.add(new OneOfferData.fromJson(v));
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

class OneOfferData {
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

  OneOfferData(
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

  OneOfferData.fromJson(Map<String, dynamic> json) {
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
