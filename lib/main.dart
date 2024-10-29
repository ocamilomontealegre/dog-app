import 'package:flutter/material.dart';
import 'package:dog_app/src/screens/home.screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: "Dog App", home: Home());
  }
}
