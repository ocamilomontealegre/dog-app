import 'package:flutter/material.dart';
import 'package:dog_app/src/screens/home.screen.dart';
import "package:dog_app/src/config/env.config.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Config.load();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: "Dog App", debugShowCheckedModeBanner: false, home: Home());
  }
}
