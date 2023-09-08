import 'package:flutter/material.dart';
import 'package:flutter_intro_project/utils/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Image.asset(
              "assets/images/login_image.png",
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 30.0,
              child: Text('Welcome to First App'),
            ),
            const Text(
              "Login",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: "Enter Username", labelText: "Username"),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: "Enter Password", labelText: "Password"),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.homeRoute);
                },
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    minimumSize: const Size(150, 50),
                    backgroundColor: Colors.pink),
                child: const Text("Login")),
          ],
        ),
      ),
    );
  }
}
