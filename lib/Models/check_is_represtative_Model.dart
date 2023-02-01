class CheckIsRepresentativeModel {
  String? status;
  String? message;
  CheckIsRepresentativeData? data;

  CheckIsRepresentativeModel({this.status, this.message, this.data});

  CheckIsRepresentativeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? new CheckIsRepresentativeData.fromJson(json['data'])
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

class CheckIsRepresentativeData {
  int? isRepresentative;

  CheckIsRepresentativeData({this.isRepresentative});

  CheckIsRepresentativeData.fromJson(Map<String, dynamic> json) {
    isRepresentative = json['is_representative'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_representative'] = this.isRepresentative;
    return data;
  }
}
