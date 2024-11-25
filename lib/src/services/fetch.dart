import "dart:convert";

import "package:http/http.dart" as http;
import "package:dog_app/src/config/env/global-env.config.dart";
import "package:dog_app/src/common/enums/endpoint-resources.enum.dart";
import "package:dog_app/src/common/models/breed.model.dart";

List<Breed> parseBreeds(List<Map<String, dynamic>> jsonArray) {
  return jsonArray
      .map((json) {
        try {
          return Breed.fromJson(json);
        } catch (error) {
          print("Error parsing breed: $error");
          return null;
        }
      })
      .whereType<Breed>()
      .toList();
}

Future<List<Breed>> fetch() async {
  String url =
      "${EnvConfig.dogApiEnvConfig.baseUrl}${EndpointResources.breeds.name}";
  Map<String, String> headers = {
    "Content-Type": "application/json",
    "x-api-key": EnvConfig.dogApiEnvConfig.key
  };

  final response = await http.get(Uri.parse(url), headers: headers);
  if (response.statusCode == 200) {
    List<Map<String, dynamic>> jsonArray =
        List<Map<String, dynamic>>.from(jsonDecode(response.body));
    return parseBreeds(jsonArray);
  } else {
    throw Exception("Failed");
  }
}
