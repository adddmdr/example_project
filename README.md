# Example Project

Flutter app that showcases Rick & Morty episodes with an architecture (presentation / application / domain / infrastructure).


## Project Structure

```
lib/
├─ application/    # State management (cubits/states)
├─ core/           # DI, router, constants
├─ domain/         # Models, repositories contracts, utilities
├─ infrastructure/ # Dio repositories, storage services
└─ presentation/   # Widgets and pages
```

## Key Packages

- `flutter_bloc` for state management
- `dio` for networking
- `dartz` for `Either` error handling
- `go_router` for navigation
- `get_it` for dependency injection
- `json_serializable` / `build_runner` for model code-gen
- `logger` for logging

## Useful Command

```bash

# Refresh generated files while watching for changes
flutter pub run build_runner watch --delete-conflicting-outputs
```

## Environment

- Flutter SDK: 3.6.0+
- Dart SDK: 3.6.0+


