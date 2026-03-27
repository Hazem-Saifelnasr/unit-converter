import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/theme/app_theme.dart';
import '../features/converter/presentation/converter_screen.dart';
import 'theme_mode_controller.dart';

class UnitConverterApp extends ConsumerWidget {
  const UnitConverterApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Unit Converter',
      debugShowCheckedModeBanner: false,
      themeMode: ref.watch(themeModeControllerProvider),
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      home: const ConverterScreen(),
    );
  }
}
