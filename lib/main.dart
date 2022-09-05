import 'package:drift_crud/database/studentdb.dart';
import 'package:drift_crud/views/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

late MyDatabase myDatabase;

void main() {
  myDatabase = MyDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drift',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}
