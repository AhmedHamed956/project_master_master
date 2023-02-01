class PerformanceModel {
  String? status;
  bool? message;
  PerformanceData? data;

  PerformanceModel({this.status, this.message, this.data});

  PerformanceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? new PerformanceData.fromJson(json['data'])
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

class PerformanceData {
  int? countOrder;
  double? hours;
  int? acceptance;
  String? rating;

  PerformanceData({this.countOrder, this.hours, this.acceptance, this.rating});

  PerformanceData.fromJson(Map<String, dynamic> json) {
    countOrder = json['count_order'];
    hours = json['hours'];
    acceptance = json['acceptance'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count_order'] = this.countOrder;
    data['hours'] = this.hours;
    data['acceptance'] = this.acceptance;
    data['rating'] = this.rating;
    return data;
  }
}
