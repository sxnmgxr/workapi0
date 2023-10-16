import 'package:flutter/material.dart';
import 'package:workapi0/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Work with API"),
        ),
        body: const HomePage(),
      ),
    );
  }
}
