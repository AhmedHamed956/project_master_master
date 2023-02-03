class SuggestSearchResponse {
  String? _message;
  List<String>? _data;

  String? get message => _message;

  List<String>? get data => _data;

  SuggestSearchResponse({String? message, List<String>? data}) {
    _message = message;
    _data = data;
  }

  SuggestSearchResponse.fromJson(dynamic json) {
    _message = json["message"];
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data?.add(v['name'].toString());
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["message"] = _message;
    if (_data != null) {
      // map["data"] = _data?.map((v) => v['name'].toString()).toList();
      // map['data'] = this.data!.map((v) => v.toJson()) as String.toList();
    }
    return map;
  }
}
