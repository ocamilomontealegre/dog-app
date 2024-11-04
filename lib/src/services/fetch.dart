import "package:http/http.dart" as http;

Future<http.Response> fetch() {
  return http.get(Uri.parse(""), headers: {
    "Content-Type": "application/json",
    "x-api-key":
        "live_d4dCNvnUSQCPuqv55RkbTtZtV1kokKbh5HCtMreDRSfEliOdIYkqTeiDYTZ8u7O3"
  });
}
