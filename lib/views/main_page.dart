import 'dart:developer';
import 'package:drift_crud/views/constants.dart';
import 'package:drift_crud/views/student_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose one Option"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "How To View Your Database ?",
              style: TextStyle(fontSize: 25),
            ),
            kHeight,
            const Text("Choose one Option"),
            kHeight,
            ElevatedButton(
              onPressed: () {
                log("Without Isolates Clicked");
                Get.to(
                  const HomeScreen(wIso: false),
                );
              },
              child: const Text("Without Isolates"),
            ),
            kHeight,
            ElevatedButton(
              onPressed: () {
                log("With Isolates Clicked");
                Get.to(
                  const HomeScreen(wIso: true),
                );
              },
              child: const Text("With Isolates"),
            ),
          ],
        ),
      ),
    );
  }
}
