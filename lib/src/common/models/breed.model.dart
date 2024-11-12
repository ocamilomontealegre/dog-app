class Breed {
  final int id;
  final String name;

  const Breed({required this.id, required this.name});

  factory Breed.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "id": int id,
        "name": String name,
      } =>
        Breed(id: id, name: name),
      _ => throw const FormatException("Failed to load from breed")
    };
  }
}
