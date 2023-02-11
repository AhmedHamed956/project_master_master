class UserModel {
  int? id;
  String? name;
  String? email;
  String? userName;
  String? phone;
  Null? emailVerifiedAt;
  Null? twoFactorSecret;
  Null? twoFactorRecoveryCodes;
  int? isAdmin;
  int? isInvestor;
  int? isRepresentative;
  int? isClient;
  int? isOnline;
  String? avatar;
  String? createdAt;
  String? updatedAt;
  String? lastActivity;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.userName,
      this.phone,
      this.emailVerifiedAt,
      this.twoFactorSecret,
      this.twoFactorRecoveryCodes,
      this.isAdmin,
      this.isInvestor,
      this.isRepresentative,
      this.isClient,
      this.isOnline,
      this.avatar,
      this.createdAt,
      this.updatedAt,
      this.lastActivity});

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    userName = json['user_name'];
    phone = json['phone'];
    emailVerifiedAt = json['email_verified_at'];
    twoFactorSecret = json['two_factor_secret'];
    twoFactorRecoveryCodes = json['two_factor_recovery_codes'];
    isAdmin = json['is_admin'];
    isInvestor = json['is_investor'];
    isRepresentative = json['is_representative'];
    isClient = json['is_client'];
    isOnline = json['is_online'];
    avatar = json['avatar'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    lastActivity = json['last_activity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['user_name'] = userName;
    data['phone'] = phone;
    data['email_verified_at'] = emailVerifiedAt;
    data['two_factor_secret'] = twoFactorSecret;
    data['two_factor_recovery_codes'] = twoFactorRecoveryCodes;
    data['is_admin'] = isAdmin;
    data['is_investor'] = isInvestor;
    data['is_representative'] = isRepresentative;
    data['is_client'] = isClient;
    data['is_online'] = isOnline;
    data['avatar'] = avatar;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['last_activity'] = lastActivity;
    return data;
  }
}
