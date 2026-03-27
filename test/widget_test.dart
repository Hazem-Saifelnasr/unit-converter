import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unit_converter/app/unit_converter_app.dart';
import 'package:unit_converter/core/providers/shared_preferences_provider.dart';

void main() {
  testWidgets('updates the displayed result when the user enters a value', (
    WidgetTester tester,
  ) async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    final preferences = await SharedPreferences.getInstance();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [sharedPreferencesProvider.overrideWithValue(preferences)],
        child: const UnitConverterApp(),
      ),
    );

    await tester.enterText(find.byType(TextField), '10');
    await tester.pump();

    expect(find.text('32.8084'), findsOneWidget);
  });
}
