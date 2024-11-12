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

Future<http.Response> fetch() {
  print("${EnvConfig.dogApiEnvConfig.baseUrl}${EndpointResources.breeds.name}");
  return http.get(
      Uri.parse(
          "${EnvConfig.dogApiEnvConfig.baseUrl}/${EndpointResources.breeds.name}"),
      headers: {
        "Content-Type": "application/json",
        "x-api-key": EnvConfig.dogApiEnvConfig.key
      });
}
