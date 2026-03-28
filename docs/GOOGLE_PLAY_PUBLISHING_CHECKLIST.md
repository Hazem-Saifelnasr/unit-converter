# Google Play Publishing Checklist

## 1. App Setup

- [x] Sign in to Google Play Console.
- [x] Create the app entry.
- [x] Set app name to `Unit Converter`.
- [x] Choose the default language.
- [x] Select `App`.
- [x] Choose free or paid.

## 2. Internal Testing _(Optional)_

- [x] Open `Testing` -> `Internal testing`.
- [x] Create an internal testing release if you want a quick pre-check.
- [x] Upload `releases/android/1.0.0+1/unit-converter-1.0.0+1-release.aab`.
- [x] Select testers and roll out the internal release.

## 3. Finish App Setup, App Content, And Data Safety

- [x] Open the app `Dashboard`.
- [x] Open `Policy and programs` or `App content`.
- [x] Prepare the privacy policy text from `docs/PRIVACY_POLICY.md`.
- [x] Host the privacy policy on a public URL.
- [x] Paste the public privacy policy URL into Play Console.
- [x] Use `docs/GITHUB_PAGES_PRIVACY_POLICY.md` if GitHub Pages is the chosen host.
- [x] Complete `App access` and choose the option that says all functionality is available without login.
- [x] Complete `Ads` and choose `No`.
- [x] Complete `Content rating`.
- [x] Complete `Target audience`.
- [x] Complete `Data safety`.
- [x] Complete `Government apps` and choose `No`.
- [x] Complete `Financial features` and choose `No`.
- [x] Complete `Health` and choose `No`.
- [x] Confirm the app is not a news app if that declaration appears.
- [x] Declare that the app does not collect data.
- [x] Declare that the app does not share data.
- [x] Do not enable analytics, ads, account, or crash-reporting answers that do not apply.
- [x] Confirm the app works offline.
- [x] Make sure the Data safety answers match the privacy statement in `README.md`.
- [x] Select app category `Tools` if that category is available.
- [x] Set support email to `hazem.saifelnasr@gmail.com`.
- [x] Finish the store listing basics.

## 4. Store Listing

- [x] Open `Store presence` or `Main store listing`.
- [x] Set title to `Unit Converter`.
- [x] Set short description to `Fast offline unit conversions for daily measurements.`
- [x] Paste the approved full description from `README.md`.
- [x] Upload the app icon.
  Use `release-assets/store-listing/google-play-app-icon-512.png`.
  Requirement: `32-bit PNG`, `512x512`, maximum `1024 KB`.
- [x] Upload the feature graphic.
  Use `release-assets/store-listing/google-play-feature-graphic-1024x500.png`.
  Requirement: `PNG` or `JPEG`, maximum `15 MB`, `1024x500`.
- [x] Upload phone screenshots from `release-assets/screenshots/`.
- [x] Upload at least one `7-inch tablet` screenshot from `release-assets/screenshots/tablets/`.
- [x] Upload at least one `10-inch tablet` screenshot from `release-assets/screenshots/tablets/`.
- [x] Set support email to `hazem.saifelnasr@gmail.com`.
- [x] Save the store listing.

## 5. Closed Testing

- [x] Open `Testing` -> `Closed testing`.
- [x] Set up the closed test track.
- [x] Choose countries and regions for the closed test.
- [x] Add the tester list.
- [-] Get at least `12 testers` opted in.
- [x] Create a new closed testing release.
- [x] Upload `releases/android/1.0.0+1/unit-converter-1.0.0+1-release.aab`.
- [x] Set release name to `1.0.0 Closed Test 1`.
- [x] Add closed testing release notes.
- [x] Preview and confirm the closed test release.
- [x] Send the release to Google for review if prompted.
- [ ] Keep the closed test running for at least `14 days`.

## 6. Tester Recruitment And Follow-Up

- [ ] Build a tester pool of at least `15 to 20` Android users.
- [ ] Collect the Google account email for each tester.
- [ ] Add the tester emails to the closed testing track.
- [ ] Send the Play Console opt-in link to each tester.
- [ ] Confirm each tester used the same Google account for opt-in.
- [ ] Confirm each tester installed the app from Google Play.
- [ ] Confirm each tester opened the app at least once.
- [ ] Ask testers to keep the app installed during the `14-day` test window.
- [ ] Track opted-in testers daily until at least `12` are active.
- [ ] Collect tester feedback about crashes, UI issues, and incorrect conversions.

## 7. Production Access

- [ ] Return to the app `Dashboard` after the closed test criteria are met.
- [ ] Open the production access prompt.
- [ ] Answer the closed test questions.
- [ ] Submit the production access request.
- [ ] Wait for production access approval.

## 8. Pricing And Distribution

- [ ] Choose the countries or regions for release.
- [ ] Confirm free or paid status.
- [ ] Review any device availability warnings.

## 9. Production Release

- [ ] Open the release track.
- [ ] Create a new release.
- [ ] Upload `releases/android/1.0.0+1/unit-converter-1.0.0+1-release.aab`.
- [ ] Wait for bundle processing to finish.
- [ ] Add production release notes for `1.0.0+1`.
- [ ] Review Play Console warnings and errors.
- [ ] Resolve all blocking issues.

## 10. Final Release Review

- [ ] Confirm the uploaded `.aab` is attached to the production release.
- [ ] Review the full store listing.
- [ ] Review icon, screenshots, descriptions, support email, and privacy answers.

## 11. Publish

- [ ] Start the production rollout.
- [ ] Monitor review status and post-release feedback.
