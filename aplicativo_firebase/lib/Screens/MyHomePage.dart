import 'dart:developer';

import 'package:aplicativo_firebase/Model/Data.dart';
import 'package:aplicativo_firebase/Provider/Service.dart';
import 'package:aplicativo_firebase/Widgets/CustomDrawer.dart';
import 'package:aplicativo_firebase/Widgets/Form.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text("Welcome", style: TextStyle(color: Colors.white))),
      drawer: CustomDrawer(),
      body: Forms(),
    ));
  }
}
