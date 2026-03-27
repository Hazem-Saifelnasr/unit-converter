# Unit Converter

Unit Converter is a small, polished Flutter utility app for Android. It works fully offline and covers six practical categories: length, weight, temperature, area, volume, and speed.

## Features

- Instant conversion updates as the user types
- Proper temperature formulas for Celsius, Fahrenheit, and Kelvin
- Copy result, clear input, and swap units actions
- Recent conversion history stored on-device
- Material 3 UI with light and dark theme support
- No account, backend, ads, or network dependency

## Project Structure

- `lib/app/`: app bootstrap and theme wiring
- `lib/core/`: shared helpers such as formatting
- `lib/features/converter/data/`: local history persistence
- `lib/features/converter/domain/`: categories, units, and conversion logic
- `lib/features/converter/presentation/`: Riverpod controller and UI
- `test/`: widget and conversion logic tests

## Setup

1. Install Flutter stable and Android Studio or the Android SDK.
2. Run `flutter pub get`.
3. Start an emulator or connect an Android device.

## Run and Build

- `flutter run -d android`: run the app locally
- `flutter analyze`: run static analysis
- `flutter test`: run unit and widget tests
- `flutter build apk --release`: generate a release APK
- `flutter build appbundle --release`: generate an Android App Bundle for Play Console

The Android package name is `com.saifelnasr.unit_converter`.

## Play Store Listing Suggestions

Title: `Unit Converter`

Short description: `Fast offline unit conversions for daily measurements.`

Full description: `Unit Converter is a clean, lightweight utility for quick daily conversions. Convert length, weight, temperature, area, volume, and speed instantly with an offline-first experience, recent history, result copy, unit swap, and a polished Material 3 interface.`

## App Icon Guidance

Use a simple measurement-focused icon that reads clearly at small sizes, such as a ruler, scale mark, or bidirectional arrows inside a clean geometric shape. Keep contrast high, avoid tiny text, and export adaptive Android launcher assets from a 1024x1024 source.

## Privacy Statement

This app does not collect personal data. Conversions and recent history stay on-device. No account, cloud sync, analytics, or external APIs are required for core functionality.

## Future Improvements

- Favorite conversion pairs
- Search within unit lists
- More categories and units
- Optional formatting controls
