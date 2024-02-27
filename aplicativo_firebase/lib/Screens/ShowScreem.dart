import 'package:aplicativo_firebase/Widgets/CustomDrawer.dart';
import 'package:aplicativo_firebase/Widgets/ListWidget.dart';
import 'package:flutter/material.dart';

class ShowScreem extends StatefulWidget {
  const ShowScreem({super.key});
  static const String nombre = 'showScreem';
  @override
  State<ShowScreem> createState() => _ShowScreemState();
}

class _ShowScreemState extends State<ShowScreem> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text("Information", style: TextStyle(color: Colors.white)),
      ),
      body: const ListWidget(),
    ));
  }
}
