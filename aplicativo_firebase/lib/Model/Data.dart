import 'dart:convert';

class Data {
  String? _id;
  String? _name;
  String? _lastname;
  String? _days;
  String? _cigarettes;
  String? _status;

  Data({
    String? id,
    String? name,
    String? lastname,
    String? days,
    String? cigarettes,
    String? status,
  })  : _id = id,
        _name = name,
        _lastname = lastname,
        _days = days,
        _cigarettes = cigarettes,
        _status = status;

  String? get id => _id;
  String? get name => _name;
  String? get lastname => _lastname;
  String? get days => _days;
  String? get cigarettes => _cigarettes;
  String? get status => _status;

  set id(String? id) => _id = id;
  set name(String? name) => _name = name;
  set lastname(String? lastname) => _lastname = lastname;
  set days(String? days) => _days = days;
  set cigarettes(String? cigarettes) => _cigarettes = cigarettes;
  set status(String? status) => _status = status;

  factory Data.fromJson(Map<String, dynamic> json) {
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
      'id': _id,
      'name': _name,
      'lastname': _lastname,
      'days': _days,
      'cigarettes': _cigarettes,
      'status': _status,
    };
  }
}
