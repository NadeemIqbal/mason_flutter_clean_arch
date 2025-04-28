import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:{{project_name.snakeCase()}}/presentation/{{feature_name.snakeCase()}}/view/mobile/{{feature_name.snakeCase()}}_page.dart';

// Extension method to add routes to app_router.dart
extension {{feature_name.pascalCase()}}Routes on List<RouteBase> {
  // Call this method in your app_router.dart to add these routes
  List<RouteBase> add{{feature_name.pascalCase()}}Routes() {
    return [
      ...this,
      GoRoute(
        path: '/{{feature_name.paramCase()}}',
        name: '{{feature_name.camelCase()}}',
        builder: (context, state) => const {{feature_name.pascalCase()}}Page(),
      ),
      GoRoute(
        path: '/{{feature_name.paramCase()}}/:id',
        name: '{{feature_name.camelCase()}}Details',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return {{feature_name.pascalCase()}}DetailsPage(id: id);
        },
      ),
    ];
  }
}

// Add this to your app_router.dart:
/*
static final _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
  ].add{{feature_name.pascalCase()}}Routes(),  // <-- Add this line
  errorBuilder: (context, state) => const NotFoundPage(),
);
*/ 