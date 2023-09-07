import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final int day = 1;
  final String name = "Prathik";
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(child: Text("Welcome to Day $day of Flutter by $name")),
    );
  }
}
