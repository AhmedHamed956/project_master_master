import 'package:project/src/ui/delivery_package/data/model/statistics/statistic_model.dart';

class StatisticsResponse {
  StatisticsResponse({
    String? status,
    bool? message,
    StatisticModel? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  StatisticsResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? StatisticModel.fromJson(json['data']) : null;
  }

  String? _status;
  bool? _message;
  StatisticModel? _data;

  String? get status => _status;

  bool? get message => _message;

  StatisticModel? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}
