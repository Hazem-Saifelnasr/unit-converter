# Release Checklist

Last reviewed by Codex: 2026-03-27

## Product Readiness

- [x] Android-only scope matches the PRD.
- [x] App name is `Unit Converter`.
- [x] Core categories exist: Length, Weight / Mass, Temperature, Area, Volume, Speed.
- [x] Numeric input updates the result instantly.
- [x] Swap units action exists.
- [x] Copy result action exists.
- [x] Clear input action exists.
- [x] Recent conversion history is stored locally with `SharedPreferences`.
- [x] Light and dark themes are enabled with Material 3.
- [x] Conversion logic is separated from the UI layer.

## Automated Checks

- [x] `flutter analyze`
- [x] `flutter test`
- [x] Conversion tests cover standard linear conversions.
- [x] Temperature tests cover formula-based conversion.
- [x] History persistence is covered by tests.
- [x] Widget test covers result updates from user input.

## Privacy And Policy

- [x] No authentication, cloud sync, ads, or backend code is included.
- [x] No personal data collection is implemented in app code.
- [x] No dangerous Android permissions are declared in `android/app/src/main/AndroidManifest.xml`.
- [x] App behavior is consistent with an offline utility app.

## Release Packaging

- [ ] Configure real release signing.
  Current state: `android/app/build.gradle.kts` signs release builds with the debug config and is not Play Store ready.
- [ ] Build and verify a release `apk`.
- [ ] Build and verify a release `appbundle`.
- [x] Build and launch a debug build on a physical Android device.
- [ ] Test install the release build on a physical Android device.
- [ ] Replace the default launcher icon with a production app icon.
- [ ] Capture Play Store screenshots for light theme.
- [ ] Capture Play Store screenshots for dark theme.
- [ ] Finalize support contact details for the store listing.

## Manual QA

- [x] Verify all six categories with spot-check values on a real phone.
- [x] Verify copy result shows feedback and copies the expected value.
- [x] Verify clear input resets the result state cleanly.
- [x] Verify recent history ordering is newest first in the running app.
- [x] Verify delete history clears all saved items in the running app.
- [x] Verify layout remains readable on smaller Android screens.
- [x] Verify light and dark theme contrast and tap targets on a physical device.

## Known Blockers

- [x] No known blockers at the moment.
