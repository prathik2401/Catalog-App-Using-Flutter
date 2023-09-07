import 'package:flutter/material.dart';

void main() {
  runApp(const MyApplication());
}

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Material(
        child: Center(child: Text("Welcome to First Flutter Application.")),
      ),
    );
  }
}
