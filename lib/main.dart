import 'package:flutter/material.dart';
import 'package:flutter_intro_project/pages/home_page.dart';
import 'package:flutter_intro_project/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApplication());
}

// ignore: must_be_immutable
class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      darkTheme: ThemeData(primarySwatch: Colors.cyan),
      initialRoute: "/",
      routes: {
        "/": (context) => const LoginPage(),
        "/home": (context) => const HomePage(),
        "/login": (context) => const LoginPage()
      },
    );
  }
}
