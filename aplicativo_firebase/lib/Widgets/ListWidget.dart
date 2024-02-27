import 'dart:developer';

import 'package:aplicativo_firebase/Model/Data.dart';
import 'package:aplicativo_firebase/Provider/Service.dart';
import 'package:flutter/material.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({super.key});

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  late Future<List<Data>> dataList;
  Services Service = Services();
  @override
  void initState() {
    super.initState();
    dataList = Service.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Data>>(
      future: dataList,
      builder: (context, snapshot) {
      
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
         
          return Text('Error: ${snapshot.error}');
        } else {

          List<Data>? data = snapshot.data;
          
          if (data != null && data.isNotEmpty) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                // Construye cada elemento de la lista aquí
                return ListTile(
               title: Text(data[index].name.toString()),
                );
              },
            );
          } else {
           
            return Text('No hay datos disponibles');
          }
        }
      },
    );
  }

}
