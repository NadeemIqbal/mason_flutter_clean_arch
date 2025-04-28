import 'package:flutter/material.dart';
import 'core/dependency_injection/setup_di.dart';
import 'core/config/app_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize app configuration
  AppConfig.initialize();
  
  // Setup dependencies
  setupDependencies();
  
  runApp(const {{project_name}}App());
}

class {{project_name}}App extends StatelessWidget {
  const {{project_name}}App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('{{project_name}}'),
      ),
      body: const Center(
        child: Text('Welcome to {{project_name}}'),
      ),
    );
  }
} 