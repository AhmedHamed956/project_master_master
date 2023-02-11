class CheckIsRepresentativeModel {
  String? status;
  String? message;
  CheckIsRepresentativeData? data;

  CheckIsRepresentativeModel({this.status, this.message, this.data});

  CheckIsRepresentativeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? CheckIsRepresentativeData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_representative'] = isRepresentative;
    return data;
  }
}
