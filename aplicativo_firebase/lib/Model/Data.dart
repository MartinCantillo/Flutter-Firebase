import 'dart:convert';

class Data {
  final int? id;
  final int? dias;
  final int? cigarrillos;
  final int? estado;

  Data(
      {required this.id,
      this.dias,
      required this.cigarrillos,
      required this.estado});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        id: json['id'],
        dias: json['dias'],
        cigarrillos: json['cigarrillos'],
        estado: json['estado']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dias': dias,
      'cigarrillos': cigarrillos,
      'estado': estado
    };
  }
}
