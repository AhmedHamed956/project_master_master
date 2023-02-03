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

  UserModel.fromJson(Map<String, dynamic> json) {
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
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['user_name'] = this.userName;
    data['phone'] = this.phone;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['two_factor_secret'] = this.twoFactorSecret;
    data['two_factor_recovery_codes'] = this.twoFactorRecoveryCodes;
    data['is_admin'] = this.isAdmin;
    data['is_investor'] = this.isInvestor;
    data['is_representative'] = this.isRepresentative;
    data['is_client'] = this.isClient;
    data['is_online'] = this.isOnline;
    data['avatar'] = this.avatar;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['last_activity'] = this.lastActivity;
    return data;
  }
}
