import 'package:flutter/material.dart';
import 'package:flutter_intro_project/home_page.dart';

void main() {
  runApp(const MyApplication());
}

// ignore: must_be_immutable
class MyApplication extends StatelessWidget {
  const MyApplication({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
