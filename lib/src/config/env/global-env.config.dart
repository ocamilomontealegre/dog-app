import "dart:convert";

import "package:universal_io/io.dart";
import "package:flutter/foundation.dart";
import "package:flutter/services.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "app-env.config.dart";
import "dog-api-env.config.dart";

class EnvConfig {
  static late AppEnvConfig appEnvConfig;
  static late DogApiEnvConfig dogApiEnvConfig;

  static Future<void> load() async {
    if (Platform.isAndroid || Platform.isIOS) {
      await dotenv.load(fileName: ".env");

      appEnvConfig = AppEnvConfig(
          name: dotenv.env["APP_NAME"] ?? "Flutter App",
          version: dotenv.env["APP_VERSION"] ?? "1.0.0");
    }

    if (kIsWeb) {
      await _loadWebConfig();
    }

    _validate();
  }

  static Future<void> _loadWebConfig() async {
    try {
      String webConfigPath = "assets/config/web_config.json";
      final String jsonString = await rootBundle.loadString(webConfigPath);
      final Map<String, dynamic> config = jsonDecode(jsonString);

      appEnvConfig = AppEnvConfig(
          name: config["app"]["APP_NAME"],
          version: config["app"]["APP_VERSION"]);

      dogApiEnvConfig = DogApiEnvConfig(
          baseUrl: config["dog-api"]["BASE_URL"],
          key: config["dog-api"]["KEY"]);
    } catch (e) {
      print("Error loading web config $e");
    }
  }

  static void _validate() {}
}
