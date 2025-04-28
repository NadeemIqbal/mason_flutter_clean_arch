# Add Clean Architecture Feature Brick

A Mason brick to add a new feature to a clean architecture Flutter/Dart project with go_router integration.

## Installation

```bash
mason add add_clean_arch_brick
```

## Usage

```bash
mason make add_clean_arch_brick
```

## Features

- **Feature Scaffolding**: Generates all necessary files for a new feature
- **Clean Architecture**: Proper separation of layers (Domain, Data, and Presentation)
- **go_router Integration**: Route generation for the feature
- **BLoC Integration**: Optional BLoC state management
- **Platform-Specific Views**: Support for multiple platforms (mobile, desktop, tablet)

## Variables

| Variable         | Description                         | Default     | Type      |
|------------------|-------------------------------------|-------------|-----------|
| `feature_name`   | Name of the feature                 | Required    | `string`  |
| `needs_contract` | Whether to use contracts            | `true`      | `boolean` |
| `platform_support` | Supported platforms               | `["mobile"]` | `list`   |
| `use_bloc`       | Whether to use BLoC                 | `true`      | `boolean` |
| `include_widgets`| Whether to include widget structure | `true`      | `boolean` |

## Output

This brick adds a new feature to your clean architecture project. Here's what it generates:

### Domain Layer
```
domain/
├── contracts/
│   └── feature_contract.dart (if needs_contract is true)
└── usecases/
    └── feature_usecase.dart
```

### Data Layer
```
data/
└── contracts_impl/
    └── feature_impl/
        └── feature_impl.dart (if needs_contract is true)
```

### Presentation Layer
```
presentation/
└── feature/
    ├── blocs/ (if use_bloc is true)
    │   ├── feature_bloc.dart
    │   ├── feature_event.dart
    │   └── feature_state.dart
    └── view/
        ├── mobile/ (if platform_support includes "mobile")
        │   └── feature_page.dart
        ├── desktop/ (if platform_support includes "desktop")
        └── tablet/ (if platform_support includes "tablet")
```

### Routing
```
core/
└── routing/
    └── feature_routes.dart (adds go_router routes for the feature)
```

### Dependency Injection
```
core/
└── dependency_injection/
    └── feature_di.dart
```

## go_router Integration

Each feature comes with a ready-to-use route extension that you can add to your app_router.dart:

```dart
// In your app_router.dart
static final _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
  ].addFeatureRoutes(),  // <-- Add this line for each feature
  errorBuilder: (context, state) => const NotFoundPage(),
);
```

## License

MIT 