class ConfirmDigitalGiftResponse {
  ConfirmDigitalGiftResponse({
      String? status, 
      String? message, 
      List<String>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  ConfirmDigitalGiftResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? json['data'].cast<String>() : [];
  }
  String? _status;
  String? _message;
  List<String>? _data;

  String? get status => _status;
  String? get message => _message;
  List<String>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['data'] = _data;
    return map;
  }

}