import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "package:dog_app/src/services/fetch.dart";
import "package:dog_app/src/common/models/breed.model.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<http.Response> futureList;

  @override
  void initState() {
    super.initState();
    futureList = fetch();
  }

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
        body: FutureBuilder<http.Response>(
            future: futureList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data);
              } else if (snapshot.hasError) {
                print(snapshot.error);
              }

              return const CircularProgressIndicator();
            }));
  }
}
