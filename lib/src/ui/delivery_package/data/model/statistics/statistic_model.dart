class StatisticModel {
  StatisticModel({
    int? countOrder,
    double? hours,
    double? acceptance,
    double? rating,
  }) {
    _countOrder = countOrder;
    _hours = hours;
    _acceptance = acceptance;
    _rating = rating;
  }

  int? _countOrder;
  double? _hours;
  double? _acceptance;
  double? _rating;

  int? get countOrder => _countOrder;

  double? get hours => _hours;

  double? get acceptance => _acceptance;

  double? get rating => _rating;

  StatisticModel.fromJson(dynamic json) {
    _countOrder = json['count_order'] ?? "";
    _hours = json['hours'];
    _acceptance = json['acceptance'] ?? "";
    _rating = json['rating'] == null ? 0.0 : double.tryParse(json['rating']);
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count_order'] = _countOrder;
    map['hours'] = _hours;
    map['acceptance'] = _acceptance;
    map['rating'] = _rating;
    return map;
  }
}
