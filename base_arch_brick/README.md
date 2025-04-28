# Base Architecture Brick

A Mason brick to create a clean architecture structure for a Flutter/Dart project with go_router for navigation.

## Installation

```bash
mason add base_arch_brick
```

## Usage

```bash
mason make base_arch_brick
```

## Features

- **Clean Architecture**: Proper separation of concerns with Domain, Data, and Presentation layers
- **go_router**: Modern declarative routing with deep link support
- **BLoC State Management**: Structured and testable state management
- **Dependency Injection**: Simple and efficient DI system
- **Structured Project Organization**: Organized project with clear responsibilities

## Variables

| Variable                 | Description                       | Default     | Type      |
|--------------------------|-----------------------------------|-------------|-----------|
| `project_name`           | Name of your project              | Required    | `string`  |
| `default_platform_support` | Supported platforms              | `["mobile"]` | `list`   |

## Output

This brick generates the base structure for a clean architecture project:

```
lib/
├── core/
│   ├── bloc/
│   ├── cache/
│   ├── config/
│   ├── constant/
│   ├── dependency_injection/
│   ├── global_bloc/
│   ├── models/
│   ├── routing/
│   │   └── app_router.dart  # go_router configuration
│   ├── services/
│   ├── sources/
│   ├── usecase/
│   └── utils/
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
└── presentation/
```

## Dependencies

The project comes with the following key dependencies:

```yaml
dependencies:
  # Navigation
  go_router: ^12.0.0

  # State Management
  flutter_bloc: ^8.1.3
  equatable: ^2.0.5

  # Network
  dio: ^5.3.0

  # Utils
  get_it: ^7.6.0
  shared_preferences: ^2.2.0
```

## License

MIT 