import 'dart:convert';

import 'package:aplicativo_firebase/Model/Data.dart';
import 'package:http/http.dart' as http;

class Service {
  final String Endpoint = '';

  Future<bool> save(Data data) async {
    try {
      final url = "";
      final response = await http.post(Uri.parse(url), body: data.toJson());
      if (response.statusCode == 200) {
        final String decodeData = jsonDecode(response.body);
        print(decodeData);
        return true;
      } else {
        throw Exception("ocurrio algo ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error ${e}");
    }
  }

  Future<List<Data>> getAll() async {
    try {
      final url = "";
      List<Data> ListData = [];
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final String decodeData = jsonDecode(response.body);
        ListData =
            Data.fromJson(decodeData as Map<String, dynamic>) as List<Data>;
        return ListData;
      } else {
        throw ("Ocurrio algo ${response.statusCode}");
      }
    } catch (e) {
      throw ("Error ${e}");
    }
  }

  Future<bool> update(Data data) async {
    try {
      final url = ".json";
      final response = await http.put(Uri.parse(url), body: data.toJson());
      if (response.statusCode == 200) {
        final decodeData = jsonDecode(response.body);
        print(decodeData);
        return true;
      } else {
        throw ("Error ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error ${e}");
    }
  }

  Future<int> delete(String id) async {
    try {
      final url = "";
      final response = await http.delete(Uri.parse(url));
      if (response.statusCode == 200) {
        String decodeData = jsonDecode(response.body);
        print(decodeData);
        return 1;
      } else {
        throw Exception("Error ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error ${e}");
    }
  }
}
