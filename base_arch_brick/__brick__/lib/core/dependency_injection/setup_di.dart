import 'di_container.dart';

void setupDependencies() {
  final di = DIContainer();

  // Register core services
  // Example: di.register<CacheManager>(SharedPrefsCacheManager());

  // Setup feature-specific dependencies will be added here
  // Example: setupAuthDependencies();
}
