import 'model/user_model.dart';

class UserResponse {
  UserModel? user;
  String? token;

  UserResponse({this.user, this.token});

  UserResponse.fromJson( dynamic json) {
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}
