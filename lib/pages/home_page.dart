import 'package:flutter/material.dart';
import 'package:flutter_intro_project/pages/login_page.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final int day = 1;
  final String name = "Prathik";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Application"),
      ),
      body: Center(child: Text("Welcome to Day $day of Flutter by $name.")),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Text("Menu")),
            ListTile(
              title: const Text("Login"),
              onTap: () {
                const LoginPage();
                Navigator.pop(context, false);
              },
            )
          ],
        ),
      ),
    );
  }
}
