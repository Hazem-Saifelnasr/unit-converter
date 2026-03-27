# Release Packaging Checklist

Use this file as a strict runbook for Android release packaging. Every path below is relative to this repository root unless noted otherwise.

## 1. Release Signing

- [x] Create a secure local folder outside this repo for the keystore, for example `~/secure/android-signing/`.
- [x] Generate the upload keystore with `keytool`.
- [x] Confirm the keystore file is not stored inside this repo.
- [x] Copy [key.properties.example](/Users/hazemismail/IdeaProjects/unit_converter/android/key.properties.example) to `android/key.properties`.
- [x] Fill in `android/key.properties` with real values.
  File location: [android/key.properties.example](/Users/hazemismail/IdeaProjects/unit_converter/android/key.properties.example) shows the exact structure. The real file should live at `android/key.properties` in this repo.
- [x] Confirm `android/key.properties` is ignored by Git.
- [x] Confirm release signing is wired in [build.gradle.kts](/Users/hazemismail/IdeaProjects/unit_converter/android/app/build.gradle.kts).
  File location: edit [build.gradle.kts](/Users/hazemismail/IdeaProjects/unit_converter/android/app/build.gradle.kts) in this repo under `android/app/`.
- [x] Run `flutter build apk --release` once to verify the signing config works.

## 2. Launcher Icon

- [x] Prepare a final 1024x1024 icon source.
- [x] Generate Android launcher assets from that source.
- [x] Replace icon files under `android/app/src/main/res/`.
- [x] Rebuild the app.
- [x] Confirm the icon looks correct on the phone home screen and app drawer.

## 3. Release APK

- [x] Run `flutter clean`.
- [x] Run `flutter pub get`.
- [x] Run `flutter build apk --release`.
- [x] Confirm `build/app/outputs/flutter-apk/app-release.apk` exists.
- [x] Record the APK size [48.9MB].
- [x] Install the APK on a physical Android device.
- [x] Open the installed APK build and confirm it launches.

## 4. Release App Bundle

- [x] Run `flutter build appbundle --release`.
- [x] Confirm `build/app/outputs/bundle/release/app-release.aab` exists.
- [x] Record the version name and version code used for the bundle.
  Version name: `1.0.0`
  Version code: `1`
- [x] Move or archive the final `.aab` artifact in a known release folder.
  Archived copy: `releases/android/1.0.0+1/unit-converter-1.0.0+1-release.aab`

## 5. Release QA On Device

- [x] Launch the release build from the phone launcher.
- [x] Toggle light and dark theme from the app bar.
- [x] Enter a value and confirm the result updates instantly.
- [x] Tap the clear `X` inside the input field.
- [x] Tap the copy icon inside the result card.
- [x] Change categories and confirm unit lists update correctly.
- [x] Use swap units and confirm the result refreshes.
- [x] Create several recent history entries.
- [x] Collapse and expand the recent history section.
- [x] Delete history and confirm the list clears.
- [x] Spot-check one conversion in each category.
- [x] Put the phone in airplane mode and confirm the app still works.

## 6. Store Screenshots

- [x] Capture at least one screenshot in light theme.
- [x] Capture at least one screenshot in dark theme.
- [x] Use realistic example values and clean UI states.
- [x] Confirm no debug banner or unfinished placeholder content is visible.
- [x] Save the final screenshots in a separate release-assets location.
  Saved location: `release-assets/screenshots/`

## 7. Store Details

- [x] Confirm the app title is `Unit Converter`.
- [x] Confirm the package name is `com.saifelnasr.unit_converter`.
- [x] Finalize the support email for Play Console.
  Support email: `hazem.saifelnasr@gmail.com`
- [x] Finalize the short description.
  Current text: `Fast offline unit conversions for daily measurements.`
- [x] Finalize the full description.
  Current text is documented in `README.md` under `Play Store Listing Suggestions`.
- [x] Re-check the privacy statement against actual app behavior.
  Confirmed: no account, no analytics, no backend, no personal data collection, local history only.

## 8. Final Order

- [x] Release signing configured and verified
- [x] Launcher icon replaced
- [x] Release APK built and tested
- [x] Release app bundle built
- [x] Screenshots captured
- [x] Store details finalized
- [x] Signed `.aab` ready for Play Console upload
