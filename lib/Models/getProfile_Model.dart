class ProfileModel {
  String? status;
  String? message;
  ProfileData? data;

  ProfileModel({this.status, this.message, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new ProfileData.fromJson(json['data']) : null;
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

class ProfileData {
  int? id;
  String? name;
  String? email;
  String? userName;
  String? phone;
  Null? emailVerifiedAt;
  int? isAdmin;
  int? isInvestor;
  int? isRepresentative;
  int? isClient;
  int? isOnline;
  String? avatar;
  String? map;
  String? createdAt;
  String? updatedAt;
  String? lastActivity;

  ProfileData(
      {this.id,
      this.name,
      this.email,
      this.userName,
      this.phone,
      this.emailVerifiedAt,
      this.isAdmin,
      this.isInvestor,
      this.isRepresentative,
      this.isClient,
      this.isOnline,
      this.avatar,
      this.map,
      this.createdAt,
      this.updatedAt,
      this.lastActivity});

  ProfileData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    userName = json['user_name'];
    phone = json['phone'];
    emailVerifiedAt = json['email_verified_at'];
    isAdmin = json['is_admin'];
    isInvestor = json['is_investor'];
    isRepresentative = json['is_representative'];
    isClient = json['is_client'];
    isOnline = json['is_online'];
    avatar = json['avatar'];
    map = json['map'];
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
    data['is_admin'] = this.isAdmin;
    data['is_investor'] = this.isInvestor;
    data['is_representative'] = this.isRepresentative;
    data['is_client'] = this.isClient;
    data['is_online'] = this.isOnline;
    data['avatar'] = this.avatar;
    data['map'] = this.map;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['last_activity'] = this.lastActivity;
    return data;
  }
}
