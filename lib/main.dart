import 'package:flutter/material.dart';
import 'package:flutter_intro_project/home_page.dart';

void main() {
  runApp(MyApplication());
}

// ignore: must_be_immutable
class MyApplication extends StatelessWidget {
  int day = 1;
  String name = "Prathik";
  MyApplication({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
