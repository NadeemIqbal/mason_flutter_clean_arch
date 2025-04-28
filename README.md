# Flutter Clean Architecture Bricks

A collection of Mason bricks for quickly scaffolding Flutter applications with clean architecture, including go_router for navigation and BLoC for state management.

## Overview

This repository contains two Mason bricks:

1. **base_arch_brick**: Sets up the initial clean architecture structure
2. **add_clean_arch_brick**: Adds new features to an existing clean architecture project

Together, these bricks streamline the creation of Flutter applications that follow clean architecture principles.

## Prerequisites

Make sure you have the latest version of Mason installed. If not, follow these steps:

```bash
# Activate mason
dart pub global activate mason_cli

# Verify installation
mason --version
```

Make sure your Mason version is at least 0.1.0+.

## Installation

You can add these bricks to your Mason configuration:

```bash
# Add bricks to your mason.yaml
mason add base_arch_brick --git-url https://github.com/NadeemIqbal/mason_flutter_clean_arch_brick --git-path base_arch_brick

mason add add_clean_arch_brick --git-url https://github.com/NadeemIqbal/mason_flutter_clean_arch_brick --git-path add_clean_arch_brick
```

If you encounter any issues with the installation, try:

```bash
# Update Mason
dart pub global activate mason_cli

# Then add the bricks
mason add base_arch_brick --git-url https://github.com/NadeemIqbal/mason_flutter_clean_arch_brick --git-path base_arch_brick
```

## Usage

### Step 1: Create the base architecture

```bash
mason make base_arch_brick
```

You'll be prompted for:
- `project_name`: Name of your project
- `default_platform_support`: Platforms to support (mobile, desktop, tablet)

### Step 2: Add features as needed

```bash
mason make add_clean_arch_brick
```

You'll be prompted for:
- `feature_name`: Name of the feature
- `needs_contract`: Whether to use contracts (default: true)
- `platform_support`: Platforms to support (default: ["mobile"])
- `use_bloc`: Whether to use BLoC (default: true)
- `include_widgets`: Whether to include widget structure (default: true)

## Generated Architecture

### Base Architecture

```
lib/
├── core/
│   ├── bloc/
│   │   ├── base_bloc.dart
│   │   └── base_state.dart  
│   ├── cache/
│   │   └── cache_manager.dart
│   ├── config/
│   │   └── app_config.dart
│   ├── constant/
│   ├── dependency_injection/
│   │   ├── di_container.dart
│   │   └── setup_di.dart
│   ├── global_bloc/
│   ├── models/
│   ├── routing/
│   │   └── app_router.dart (go_router configuration)
│   ├── services/
│   ├── sources/
│   ├── usecase/
│   │   └── base_usecase.dart
│   └── utils/
│       ├── extensions/
│       └── helpers/
├── data/
│   ├── contracts_impl/
│   ├── data_sources/
│   ├── models/
│   ├── remote_config/
│   └── services/
├── domain/
│   ├── contracts/
│   ├── entities/
│   └── usecases/
├── presentation/
├── main.dart
└── pubspec.yaml (with go_router, flutter_bloc, and other dependencies)
```

### Feature Structure (when added)

```
├── domain/
│   ├── contracts/
│   │   └── feature_contract.dart (if needs_contract is true)
│   └── usecases/
│       └── feature_usecase.dart
├── data/
│   └── contracts_impl/
│       └── feature_impl/
│           └── feature_impl.dart (if needs_contract is true)
├── presentation/
│   └── feature/
│       ├── blocs/ (if use_bloc is true)
│       │   ├── feature_bloc.dart
│       │   ├── feature_event.dart
│       │   └── feature_state.dart
│       └── view/
│           ├── mobile/ (if platform_support includes "mobile")
│           │   └── feature_page.dart
│           ├── desktop/ (if platform_support includes "desktop")
│           └── tablet/ (if platform_support includes "tablet")
├── core/
│   ├── routing/
│   │   └── feature_routes.dart (adds go_router routes for the feature)
│   └── dependency_injection/
│       └── feature_di.dart
```

## Key Features

### Base Architecture Brick

- **Clean Architecture**: Proper separation of concerns with Domain, Data, and Presentation layers
- **go_router**: Modern declarative routing with deep link support
- **BLoC State Management**: Structured and testable state management 
- **Dependency Injection**: Simple and efficient DI system
- **Structured Project Organization**: Organized project with clear responsibilities

### Add Feature Brick

- **Feature Scaffolding**: Generates all necessary files for a new feature
- **Clean Architecture**: Proper separation of layers (Domain, Data, and Presentation)
- **go_router Integration**: Route generation for the feature
- **BLoC Integration**: Optional BLoC state management
- **Platform-Specific Views**: Support for multiple platforms (mobile, desktop, tablet)

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

## Dependency Management

Each feature generates its dependency injection setup:

```dart
// Add this line to your setupDependencies() function:
setupFeatureDependencies();
```

## Examples

### Sample Feature Implementation

After adding a feature named "auth":

```dart
// domain/contracts/auth_contract.dart
abstract class AuthContract {
  Future<User> login(String email, String password);
  Future<void> logout();
}

// domain/usecases/auth_usecase.dart
class LoginUseCase extends BaseUseCase<User, LoginParams> {
  final AuthContract _contract;
  
  LoginUseCase(this._contract);
  
  @override
  Future<User> call(LoginParams params) async {
    return await _contract.login(params.email, params.password);
  }
}

// presentation/auth/blocs/auth_bloc.dart
class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  
  AuthBloc(this._loginUseCase) : super(InitialState()) {
    on<LoginEvent>(_onLogin);
  }
  
  Future<void> _onLogin(
    LoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoadingState());
    try {
      final user = await _loginUseCase(LoginParams(
        email: event.email,
        password: event.password,
      ));
      emit(AuthenticatedState(user));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
```

## Best Practices

1. **Start with the base architecture**: Create your project structure first
2. **Add features incrementally**: Add one feature at a time as needed
3. **Update go_router**: Remember to add feature routes to app_router.dart
4. **Update dependency injection**: Add feature dependencies to the setup function
5. **Keep entities separate**: Domain entities should be independent of data models

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details. 