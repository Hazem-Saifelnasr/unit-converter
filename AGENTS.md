# Repository Guidelines

## Project Structure & Module Organization
This repository is a Flutter application currently targeting Android only. Main app code lives in `lib/`, with the current entry point in `lib/main.dart`. Widget tests live in `test/`, currently `test/widget_test.dart`. Native Android code is under `android/`; treat other generated platform folders as scaffold output unless a task explicitly expands platform support later.

## Build, Test, and Development Commands
Run all commands from the repository root.

- `flutter pub get`: install Dart and Flutter dependencies from `pubspec.yaml`.
- `flutter run`: start the app on the default connected emulator, simulator, or device.
- `flutter run -d android`: target an Android emulator or device during development.
- `flutter analyze`: run static analysis using `analysis_options.yaml`.
- `flutter test`: execute widget and unit tests in `test/`.
- `flutter build apk` or `flutter build appbundle`: create Android release artifacts.

## Coding Style & Naming Conventions
Follow the lints from `package:flutter_lints/flutter.yaml` via `analysis_options.yaml`. Use 2-space indentation and keep Dart files formatted with `dart format .` before opening a PR. Prefer `UpperCamelCase` for widget and class names, `lowerCamelCase` for methods and variables, and `snake_case.dart` for file names. Keep widgets small and extract reusable UI into separate files under `lib/` as the app grows.

## Testing Guidelines
Use `flutter_test` for widget coverage. Name test files with the `_test.dart` suffix and keep test descriptions behavior-focused, for example `testWidgets('increments value when add button is tapped', ...)`. Add or update tests for any UI behavior change, especially around state updates, input handling, and displayed units or conversion results.

## Commit & Pull Request Guidelines
Git history is not available in this workspace, so use short imperative commit messages such as `Add temperature conversion card` or `Fix counter widget test`. Keep each commit focused on one change. Pull requests should include a brief summary, testing notes (`flutter analyze`, `flutter test`), linked issue references when applicable, and screenshots or screen recordings for visible UI changes.

## Configuration Notes
Do not commit secrets, local SDK paths, or machine-specific overrides. Review changes to generated platform files carefully and only include them when they are required by a dependency or build configuration update.
