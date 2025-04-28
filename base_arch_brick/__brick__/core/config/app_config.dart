class AppConfig {
  static const String apiBaseUrl = String.fromEnvironment('API_BASE_URL');
  static const String appName = String.fromEnvironment('APP_NAME');
  static const bool isDebug = bool.fromEnvironment('DEBUG');

  static void initialize() {
    // Initialize app configuration
  }
}
