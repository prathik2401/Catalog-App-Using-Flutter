import 'package:flutter/material.dart';
import 'package:flutter_intro_project/pages/home_page.dart';
import 'package:flutter_intro_project/pages/login_page.dart';
import 'package:flutter_intro_project/utils/routes.dart';
import 'package:flutter_intro_project/widget/themes.dart';

void main() {
  runApp(const MyApplication());
}

// ignore: must_be_immutable
class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
      },
    );
  }
}
