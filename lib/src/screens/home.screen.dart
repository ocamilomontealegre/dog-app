import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "🐾 Dog App 🐾",
          style: TextStyle(fontFamily: "Poppins", color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
