import 'package:flutter/material.dart';
import 'package:flutter_intro_project/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

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
              child: Text('Login'),
            ),
            Align(
                alignment: Alignment.center,
                child: Text(
                  "Welcome $name",
                  style: const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.bold),
                )),
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
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
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
            InkWell(
              onTap: () async {
                setState(() {
                  changeButton = true;
                });
                await Future.delayed(const Duration(milliseconds: 1500));
                // ignore: use_build_context_synchronously
                Navigator.pushNamed(context, MyRoutes.homeRoute);
              },
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                width: changeButton ? 50 : 150,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    // shape: changeButton ? BoxShape.circle : BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                    color: Colors.pink),
                child: changeButton
                    ? const Icon(
                        Icons.done,
                        color: Colors.white,
                      )
                    : const Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
              ),
            ),
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.pushNamed(context, MyRoutes.homeRoute);
            //     },
            //     style: TextButton.styleFrom(
            //         foregroundColor: Colors.white,
            //         minimumSize: const Size(150, 50),
            //         backgroundColor: Colors.pink),
            //     child: const Text("Login")),
          ],
        ),
      ),
    );
  }
}
