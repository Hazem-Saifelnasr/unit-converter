# Release Packaging Guide

This document expands the `Release Packaging` section from `docs/RELEASE_CHECKLIST.md` into concrete release steps for the Android app.

## 1. Configure Real Release Signing

Why it matters: Google Play requires a properly signed release build. The project currently signs release builds with the debug key in `android/app/build.gradle.kts`, which is not production-ready.

Steps:

1. Create a secure local folder for signing material, for example:

```bash
mkdir -p ~/Programming/secure/android-signing
```

2. Generate an upload keystore:

```bash
keytool -genkeypair \
  -v \
  -keystore ~/Programming/secure/android-signing/unit-converter-upload.jks \
  -keyalg RSA \
  -keysize 2048 \
  -validity 10000 \
  -alias unit_converter_upload
```

3. Choose and store these four values safely:

- keystore file path
- store password
- key alias
- key password

What the passwords mean:

- `storePassword` is the password for opening the keystore file itself.
- `keyPassword` is the password for the specific alias inside that keystore.
- These two values can be different.
- They can also be the same if you chose the same password during the `keytool` flow.

What `keytool` usually asks for:

- first password prompt: keystore password -> use this as `storePassword`
- alias prompt: alias name -> use this as `keyAlias`
- key password prompt: use this as `keyPassword`
- if you press Enter at the key password prompt, Java may reuse the keystore password

How to get the absolute path:

- `storeFile` must be an absolute path to the `.jks` file.
- Example:

```text
/Users/hazemismail/Programming/secure/android-signing/unit-converter-upload.jks
```

- To print the absolute path on your machine, run:

```bash
python3 -c 'import os; print(os.path.abspath(os.path.expanduser("~/Programming/secure/android-signing/unit-converter-upload.jks")))'
```

4. Create `android/key.properties` in this repository under the `android/` folder.

Exact repo location:

```text
android/key.properties
```

You can start from the example file at `android/key.properties.example`.

5. Put these values in `android/key.properties`:

```properties
storePassword=YOUR_STORE_PASSWORD
keyPassword=YOUR_KEY_PASSWORD
keyAlias=YOUR_KEY_ALIAS
storeFile=/absolute/path/to/your-upload-keystore.jks
```

Meaning of each field:

- `storePassword`: password for the keystore file
- `keyPassword`: password for the alias inside that keystore
- `keyAlias`: alias name used when the key was created
- `storeFile`: absolute path to the `.jks` file

6. Update `android/app/build.gradle.kts` in this repository.

Exact repo location:

```text
android/app/build.gradle.kts
```

7. In that file:

- load `android/key.properties`
- create a `release` signing config
- point `buildTypes.release` to that signing config

8. Keep the debug signing fallback only for the case where `android/key.properties` does not exist yet. Remove it later if you want release signing to be mandatory.

```kotlin
signingConfig = signingConfigs.getByName("debug")
```

9. Confirm the keystore file stays outside the repo.
10. Confirm `android/key.properties` is ignored by Git before committing.
11. Run a release build once to verify the signing config is valid.

## 2. Replace The Default Launcher Icon

Why it matters: the current default Flutter icon is not suitable for store release. Replacing it before the signed build avoids rebuilding the release package twice.

Steps:

1. Create a square 1024x1024 master icon with no tiny text.
2. Prepare foreground and background artwork if using an adaptive icon.
3. Generate Android launcher assets for all required densities.
4. Replace the current launcher icon files under `android/app/src/main/res/`.
5. Rebuild the app only after the final icon is in place.
6. Install the updated build on a phone.
7. Check the icon on the home screen, app drawer, and recent apps view.
8. Fix any cropping, padding, or contrast issues before moving to signed release builds.

## 3. Build And Verify A Release APK

Why it matters: a release APK is useful for direct device installation and final smoke testing.

Steps:

1. Make sure release signing is already configured.
2. From the repo root, clean old build output:

```bash
flutter clean
```

3. Refresh dependencies:

```bash
flutter pub get
```

4. Build the signed release APK:

```bash
flutter build apk --release
```

5. Verify the output exists at:

```text
build/app/outputs/flutter-apk/app-release.apk
```

6. Record the APK size for release notes or internal review.
7. Install the APK on a physical Android device.
8. Open the app and complete the manual smoke test list before calling the APK verified.

## 4. Build And Verify A Release App Bundle

Why it matters: Google Play expects an Android App Bundle for store submission.

Steps:

1. Confirm the release signing config is working.
2. Build the app bundle:

```bash
flutter build appbundle --release
```

3. Verify the output exists at:

```text
build/app/outputs/bundle/release/app-release.aab
```

4. Record the generated version name and version code used for the bundle.
5. Keep the `.aab` artifact in a known release folder or internal handoff location.
6. Use this artifact for Play Console upload, not the debug APK.

## 5. Test The Release Build On A Physical Android Device

Why it matters: debug builds can hide performance or configuration issues that appear only in release mode.

Steps:

1. Install `build/app/outputs/flutter-apk/app-release.apk` on a real Android phone.
2. Launch the app from the launcher, not only from a cable-connected debug session.
3. Check app startup, app icon, title, and initial screen rendering.
4. Toggle light and dark theme from the app bar.
5. Enter a value and verify the result updates immediately.
6. Tap the clear `X` inside the input and verify the field resets cleanly.
7. Tap the copy icon in the result card and verify clipboard feedback appears.
8. Change categories and verify unit dropdowns update correctly.
9. Use swap units and verify the result refreshes.
10. Create several history entries and verify ordering is newest first.
11. Delete history and verify the list clears fully.
12. Put the phone in airplane mode and verify the app still works offline.

## 6. Capture Play Store Screenshots

Why it matters: screenshots are required for a proper listing and should match the actual app.

Steps:

1. Prepare a release-like build with the final icon and strings.
2. Switch the app to light theme and capture clean screenshots.
3. Switch the app to dark theme and capture clean screenshots.
4. Use realistic example values and populated recent history where helpful.
5. Remove debug banners, notifications, and unrelated status-bar clutter if possible.
6. Store the final screenshots in a dedicated release assets folder.
   Current location for this repo: `release-assets/screenshots/`
7. Confirm the screenshots match the app state that will be submitted.

## 7. Finalize Store Contact Details

Why it matters: the Play listing should include support details before submission.

Steps:

1. Decide which support email address will appear in Play Console.
2. Verify you can access that inbox before submission.
3. Confirm the public app title is `Unit Converter`.
4. Confirm the short description and full description are finalized.
5. Re-check the privacy statement against actual app behavior:

- no account
- no analytics
- no backend
- no personal data collection
- local history only

6. Confirm the package name remains `com.saifelnasr.unit_converter`.
7. Gather any remaining listing metadata before upload.

## Final Release Order

1. Configure release signing and verify it once.
2. Replace the default launcher icon.
3. Build the signed release APK.
4. Test the signed release APK on a physical Android device.
5. Build the signed release app bundle.
6. Capture final Play Store screenshots in light and dark theme.
7. Finalize support email, descriptions, and privacy wording.
8. Upload the signed `app-release.aab` to Play Console.
