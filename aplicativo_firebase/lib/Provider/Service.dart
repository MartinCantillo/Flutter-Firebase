import 'dart:convert';

import 'package:aplicativo_firebase/Model/Data.dart';
import 'package:http/http.dart' as http;

class Services {
 
  final String endpoint = "";

  Future<bool> save(Data data) async {
    try {
    
      final url = "$endpoint/Data.json";
     
      final response =
          await http.post(Uri.parse(url), body: dataModelToJson(data));
      if (response.statusCode == 200) {
     //   print(response.body);
        //  final String decodeData = jsonDecode(response.body);
        //  print(" entro a decodedata${decodeData}");
        //print(data.toJson());
     
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
        String body = utf8.decode(response.bodyBytes);
        final jsonData = jsonDecode(body);

        final listData2 = ListData.fromJsonList(jsonData);
        

        return listData2.datas;
      } else {
        throw Exception("Ocurrió algo ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error $e");
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
    print("ide entrante ${id}");
    try {
      final url = '$endpoint/Data/$id.json';
        print(url);
      final response = await http.delete(Uri.parse(url));
    print(response.body);
      if (response.statusCode == 200) {
        print("decodeData if  ");
     //   String decodeData = jsonDecode(response.body);
      //  print(decodeData);
        return 1;
      } else {
        throw Exception("Error ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error ${e}");
    }
  }
}
