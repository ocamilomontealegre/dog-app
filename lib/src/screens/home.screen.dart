import "package:flutter/material.dart";
import "package:dog_app/src/services/fetch.dart";
import "package:dog_app/src/common/models/breed.model.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Breed>> futureList;

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
        body: FutureBuilder<List<Breed>>(
            future: futureList,
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              }
              if (snapshot.hasData) {
                return ListView.builder(itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index].name),
                  );
                });
              }
              return const Center(child: Text("Not breeds found"));
            }));
  }
}
