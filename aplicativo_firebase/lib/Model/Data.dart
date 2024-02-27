import 'dart:convert';

String dataModelToJson(Data data) => json.encode(data.toJson());

class ListData {
  List<Data> datas = [];

  ListData.fromJsonList(Map<String, dynamic> jsonList) {
  if (jsonList == null) {
    return;
  } else {
    jsonList.forEach((key, json) {
      if (json is Map<String, dynamic>) {
        try {
          final value = Data.fromJson(json);
          datas.add(value);
        } catch (e) {
          print(e);
        }
      }
    });
  }
}

}

class Data {
  int? _id;
  String? _name;
  String? _lastname;
  String? _days;
  String? _cigarettes;
  int? _status;

  Data({
    int? id,
    String? name,
    String? lastname,
    String? days,
    String? cigarettes,
    int? status,
  })  : _id = id = 0,
        _name = name,
        _lastname = lastname,
        _days = days,
        _cigarettes = cigarettes,
        _status = status = 0;

  int? get id => _id;
  String? get name => _name;
  String? get lastname => _lastname;
  String? get days => _days;
  String? get cigarettes => _cigarettes;
  int? get status => _status;

  set id(int? id) => _id = id;
  set name(String? name) => _name = name;
  set lastname(String? lastname) => _lastname = lastname;
  set days(String? days) => _days = days;
  set cigarettes(String? cigarettes) => _cigarettes = cigarettes;
  set status(int? status) => _status = status;

  factory Data.fromJson(Map<String, dynamic> json) {
    //print("json entrante ${json}");

    return Data(
      id: json['id'],
      name: json['name'],
      lastname: json['lastname'],
      days: json['days'],
      cigarettes: json['cigarettes'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "cigarettes": cigarettes,
      "days": days,
      "id": id,
      "lastname": lastname,
      "name": name,
      "status": status,
    };
  }
}
