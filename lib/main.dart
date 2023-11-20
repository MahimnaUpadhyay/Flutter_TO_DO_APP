import 'package:flutter/material.dart';
import 'package:flutter_application_3/Pages/MainPage.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // init Hive
  await Hive.initFlutter();

  // Open a box
  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
      theme: ThemeData(primaryColor: Colors.black12),
    );
  }
}
