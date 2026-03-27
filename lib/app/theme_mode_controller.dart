import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/providers/shared_preferences_provider.dart';

final themeModeControllerProvider =
    NotifierProvider<ThemeModeController, ThemeMode>(ThemeModeController.new);

class ThemeModeController extends Notifier<ThemeMode> {
  static const String _themeModeKey = 'theme_mode';

  @override
  ThemeMode build() {
    final rawValue = ref
        .read(sharedPreferencesProvider)
        .getString(_themeModeKey);
    return switch (rawValue) {
      'light' => ThemeMode.light,
      _ => ThemeMode.dark,
    };
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    state = themeMode;
    await ref
        .read(sharedPreferencesProvider)
        .setString(_themeModeKey, themeMode.name);
  }
}
