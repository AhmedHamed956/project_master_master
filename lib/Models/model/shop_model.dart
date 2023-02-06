import 'category_model.dart';

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
  CategoryData? categoryData;

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
      this.updatedAt,
      this.categoryData});

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
    categoryData = json['category_data'] != null
        ? new CategoryData.fromJson(json['category_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['user_id'] = userId;
    data['logo'] = logo;
    data['background'] = background;
    data['store_name'] = storeName;
    data['CRN'] = cRN;
    data['brand_name'] = brandName;
    data['region'] = region;
    data['city'] = city;
    data['phone'] = phone;
    data['email'] = email;
    data['name'] = name;
    data['contract_status'] = contractStatus;
    data['number_employees'] = numberEmployees;
    data['is_taxable'] = isTaxable;
    data['tax_number'] = taxNumber;
    data['minimum_order'] = minimumOrder;
    data['delivery_time'] = deliveryTime;
    data['delivery_cost'] = deliveryCost;
    data['location'] = location;
    data['lat_long'] = latLong;
    data['quick_subscriber'] = quickSubscriber;
    data['from_hour'] = fromHour;
    data['to_hour'] = toHour;
    data['commission_rate'] = commissionRate;
    data['contract_starting_date'] = contractStartingDate;
    data['contract_end_date'] = contractEndDate;
    data['shop_category'] = shopCategory;
    data['number_branches'] = numberBranches;
    data['normal_notes'] = normalNotes;
    data['status_change_notes'] = statusChangeNotes;
    data['contract_file'] = contractFile;
    data['commercial_register_file'] = commercialRegisterFile;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (categoryData != null) {
      data['category_data'] = categoryData!.toJson();
    }
    return data;
  }
}
