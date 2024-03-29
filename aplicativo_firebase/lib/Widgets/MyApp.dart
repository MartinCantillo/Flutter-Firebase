import 'package:aplicativo_firebase/Screens/MyHomePage.dart';
import 'package:aplicativo_firebase/Screens/ShowScreem.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      initialRoute: MyHomePage.nombre,
      routes: {
        MyHomePage.nombre: (context) => const MyHomePage(),
        ShowScreem.nombre: (context) => const ShowScreem(),
      },
    );
  }
}
