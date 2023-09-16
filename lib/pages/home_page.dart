import 'package:flutter/material.dart';
import 'package:flutter_intro_project/widget/drawer.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  // final int day = 1;
  // final String name = "Prathik";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Catalog",
        ),
      ),
      body: const Center(child: Text("Welcome  👋")),
      drawer: const MyDrawer(),
    );
  }
}
