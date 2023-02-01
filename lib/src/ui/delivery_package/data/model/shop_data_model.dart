class ShopData {
  ShopData({
    int? id,
    int? userId,
    String? logo,
    String? background,
    String? storeName,
    String? crn,
    String? brandName,
    String? region,
    String? city,
    String? phone,
    String? email,
    String? name,
    String? contractStatus,
    int? numberEmployees,
    int? isTaxable,
    String? taxNumber,
    String? minimumOrder,
    String? deliveryTime,
    String? deliveryCost,
    String? location,
    int? quickSubscriber,
    int? fromHour,
    int? toHour,
    String? commissionRate,
    String? contractStartingDate,
    String? contractEndDate,
    String? shopCategory,
    String? numberBranches,
    String? normalNotes,
    dynamic statusChangeNotes,
    String? contractFile,
    String? commercialRegisterFile,
    String? createdAt,
    String? updatedAt,}){
    _id = id;
    _userId = userId;
    _logo = logo;
    _background = background;
    _storeName = storeName;
    _crn = crn;
    _brandName = brandName;
    _region = region;
    _city = city;
    _phone = phone;
    _email = email;
    _name = name;
    _contractStatus = contractStatus;
    _numberEmployees = numberEmployees;
    _isTaxable = isTaxable;
    _taxNumber = taxNumber;
    _minimumOrder = minimumOrder;
    _deliveryTime = deliveryTime;
    _deliveryCost = deliveryCost;
    _location = location;
    _quickSubscriber = quickSubscriber;
    _fromHour = fromHour;
    _toHour = toHour;
    _commissionRate = commissionRate;
    _contractStartingDate = contractStartingDate;
    _contractEndDate = contractEndDate;
    _shopCategory = shopCategory;
    _numberBranches = numberBranches;
    _normalNotes = normalNotes;
    _statusChangeNotes = statusChangeNotes;
    _contractFile = contractFile;
    _commercialRegisterFile = commercialRegisterFile;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  ShopData.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _logo = json['logo'];
    _background = json['background'];
    _storeName = json['store_name'];
    _crn = json['CRN'];
    _brandName = json['brand_name'];
    _region = json['region'];
    _city = json['city'];
    _phone = json['phone'];
    _email = json['email'];
    _name = json['name'];
    _contractStatus = json['contract_status'];
    _numberEmployees = json['number_employees'];
    _isTaxable = json['is_taxable'];
    _taxNumber = json['tax_number'];
    _minimumOrder = json['minimum_order'];
    _deliveryTime = json['delivery_time'];
    _deliveryCost = json['delivery_cost'];
    _location = json['location'];
    _quickSubscriber = json['quick_subscriber'];
    _fromHour = json['from_hour'];
    _toHour = json['to_hour'];
    _commissionRate = json['commission_rate'];
    _contractStartingDate = json['contract_starting_date'];
    _contractEndDate = json['contract_end_date'];
    _shopCategory = json['shop_category'];
    _numberBranches = json['number_branches'];
    _normalNotes = json['normal_notes'];
    _statusChangeNotes = json['status_change_notes'];
    _contractFile = json['contract_file'];
    _commercialRegisterFile = json['commercial_register_file'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  int? _userId;
  String? _logo;
  String? _background;
  String? _storeName;
  String? _crn;
  String? _brandName;
  String? _region;
  String? _city;
  String? _phone;
  String? _email;
  String? _name;
  String? _contractStatus;
  int? _numberEmployees;
  int? _isTaxable;
  String? _taxNumber;
  String? _minimumOrder;
  String? _deliveryTime;
  String? _deliveryCost;
  String? _location;
  int? _quickSubscriber;
  int? _fromHour;
  int? _toHour;
  String? _commissionRate;
  String? _contractStartingDate;
  String? _contractEndDate;
  String? _shopCategory;
  String? _numberBranches;
  String? _normalNotes;
  dynamic _statusChangeNotes;
  String? _contractFile;
  String? _commercialRegisterFile;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  int? get userId => _userId;
  String? get logo => _logo;
  String? get background => _background;
  String? get storeName => _storeName;
  String? get crn => _crn;
  String? get brandName => _brandName;
  String? get region => _region;
  String? get city => _city;
  String? get phone => _phone;
  String? get email => _email;
  String? get name => _name;
  String? get contractStatus => _contractStatus;
  int? get numberEmployees => _numberEmployees;
  int? get isTaxable => _isTaxable;
  String? get taxNumber => _taxNumber;
  String? get minimumOrder => _minimumOrder;
  String? get deliveryTime => _deliveryTime;
  String? get deliveryCost => _deliveryCost;
  String? get location => _location;
  int? get quickSubscriber => _quickSubscriber;
  int? get fromHour => _fromHour;
  int? get toHour => _toHour;
  String? get commissionRate => _commissionRate;
  String? get contractStartingDate => _contractStartingDate;
  String? get contractEndDate => _contractEndDate;
  String? get shopCategory => _shopCategory;
  String? get numberBranches => _numberBranches;
  String? get normalNotes => _normalNotes;
  dynamic get statusChangeNotes => _statusChangeNotes;
  String? get contractFile => _contractFile;
  String? get commercialRegisterFile => _commercialRegisterFile;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['logo'] = _logo;
    map['background'] = _background;
    map['store_name'] = _storeName;
    map['CRN'] = _crn;
    map['brand_name'] = _brandName;
    map['region'] = _region;
    map['city'] = _city;
    map['phone'] = _phone;
    map['email'] = _email;
    map['name'] = _name;
    map['contract_status'] = _contractStatus;
    map['number_employees'] = _numberEmployees;
    map['is_taxable'] = _isTaxable;
    map['tax_number'] = _taxNumber;
    map['minimum_order'] = _minimumOrder;
    map['delivery_time'] = _deliveryTime;
    map['delivery_cost'] = _deliveryCost;
    map['location'] = _location;
    map['quick_subscriber'] = _quickSubscriber;
    map['from_hour'] = _fromHour;
    map['to_hour'] = _toHour;
    map['commission_rate'] = _commissionRate;
    map['contract_starting_date'] = _contractStartingDate;
    map['contract_end_date'] = _contractEndDate;
    map['shop_category'] = _shopCategory;
    map['number_branches'] = _numberBranches;
    map['normal_notes'] = _normalNotes;
    map['status_change_notes'] = _statusChangeNotes;
    map['contract_file'] = _contractFile;
    map['commercial_register_file'] = _commercialRegisterFile;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}