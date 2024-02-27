import 'dart:convert';

import 'package:aplicativo_firebase/Model/Data.dart';
import 'package:http/http.dart' as http;

class Services {
  static int i = 1;
  final String endpoint = "TuEndpoint :v";

  Services() {}
  Future<bool> save(Data data) async {
    try {
      data.id = i;
      final url = "$endpoint/Data.json";
      // print("url save ${url}");
      final response =
          await http.post(Uri.parse(url), body: DataModelToJson(data));
      if (response.statusCode == 200) {
        print(response.body);
        //  final String decodeData = jsonDecode(response.body);
        //  print(" entro a decodedata${decodeData}");
        print(data.toJson());
        i++;
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
      final url = "$endpoint/Data.json";
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // print(response.body);
        List<Data> ListData = [];
        final Map<String, dynamic> decodeData = jsonDecode(response.body);
        decodeData.forEach((key, value) {
          ListData.add(Data.fromJson(value));
        });

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
