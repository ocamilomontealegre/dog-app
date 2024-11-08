import "package:flutter/material.dart";
import "package:dog_app/src/screens/home.screen.dart";
import "package:dog_app/src/config/env/global-env.config.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvConfig.load();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: EnvConfig.appEnvConfig.name,
        debugShowCheckedModeBanner: false,
        home: const Home());
  }
}
