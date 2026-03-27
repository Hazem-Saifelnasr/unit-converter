# Google Play Publishing Checklist

## 1. App Setup

- [x] Sign in to Google Play Console.
- [x] Create the app entry.
- [x] Set app name to `Unit Converter`.
- [x] Choose the default language.
- [x] Select `App`.
- [x] Choose free or paid.

## 2. Internal Testing _(Optional)_

- [-] Open `Testing` -> `Internal testing`.
- [-] Create an internal testing release if you want a quick pre-check.
- [-] Upload `releases/android/1.0.0+1/unit-converter-1.0.0+1-release.aab`.
- [-] Select testers and roll out the internal release.

## 3. Finish App Setup

- [ ] Open the app `Dashboard`.
- [ ] Open `Policy and programs` or `App content`.
- [ ] Prepare the privacy policy text from `docs/PRIVACY_POLICY.md`.
- [ ] Host the privacy policy on a public URL.
- [ ] Paste the public privacy policy URL into Play Console.
- [ ] Use `docs/GITHUB_PAGES_PRIVACY_POLICY.md` if GitHub Pages is the chosen host.
- [x] Complete `App access` and choose the option that says all functionality is available without login.
- [x] Complete `Ads` and choose `No`.
- [x] Complete `Content rating`.
- [x] Complete `Target audience`.
- [ ] Complete `Data safety`.
- [x] Complete `Government apps` and choose `No`.
- [x] Complete `Financial features` and choose `No`.
- [x] Complete `Health` and choose `No`.
- [ ] Select app category `Tools` if that category is available.
- [ ] Set support email to `hazem.saifelnasr@gmail.com`.
- [ ] Finish the store listing basics.

## 4. Closed Testing

- [ ] Open `Testing` -> `Closed testing`.
- [ ] Set up the closed test track.
- [ ] Choose countries and regions for the closed test.
- [ ] Add the tester list.
- [ ] Get at least `12 testers` opted in.
- [ ] Create a new closed testing release.
- [ ] Upload `releases/android/1.0.0+1/unit-converter-1.0.0+1-release.aab`.
- [ ] Preview and confirm the closed test release.
- [ ] Send the release to Google for review if prompted.
- [ ] Keep the closed test running for at least `14 days`.

## 5. Production Access

- [ ] Return to the app `Dashboard` after the closed test criteria are met.
- [ ] Open the production access prompt.
- [ ] Answer the closed test questions.
- [ ] Submit the production access request.
- [ ] Wait for production access approval.

## 6. Store Listing

- [ ] Open `Store presence` or `Main store listing`.
- [ ] Set title to `Unit Converter`.
- [ ] Set short description to `Fast offline unit conversions for daily measurements.`
- [ ] Paste the approved full description from `README.md`.
- [ ] Upload the high-resolution app icon if Play Console asks for it.
- [ ] Upload screenshots from `release-assets/screenshots/`.
- [ ] Set support email to `hazem.saifelnasr@gmail.com`.
- [ ] Save the store listing.

## 7. App Content

- [ ] Confirm the final public privacy policy URL is saved in Play Console.
- [ ] Set app access to unrestricted or no-login access.
- [ ] Confirm the app does not contain ads.
- [ ] Complete the content rating questionnaire.
- [ ] Complete the target audience section.
- [ ] Confirm the app is not a news app if that declaration appears.
- [ ] Set government apps to `No`.
- [ ] Set financial features to `No`.
- [ ] Set health to `No`.
- [ ] Complete all required app content declarations.

## 8. Data Safety

- [ ] Declare that the app does not collect data.
- [ ] Declare that the app does not share data.
- [ ] Do not enable analytics, ads, account, or crash-reporting answers that do not apply.
- [ ] Confirm the app works offline.
- [ ] Make sure the answers match the privacy statement in `README.md`.

## 9. Pricing And Distribution

- [ ] Choose the countries or regions for release.
- [ ] Confirm free or paid status.
- [ ] Review any device availability warnings.

## 10. Production Release

- [ ] Open the release track.
- [ ] Create a new release.
- [ ] Upload `releases/android/1.0.0+1/unit-converter-1.0.0+1-release.aab`.
- [ ] Wait for bundle processing to finish.
- [ ] Add production release notes for `1.0.0+1`.
- [ ] Review Play Console warnings and errors.
- [ ] Resolve all blocking issues.

## 11. Final Release Review

- [ ] Confirm the uploaded `.aab` is attached to the production release.
- [ ] Review the full store listing.
- [ ] Review icon, screenshots, descriptions, support email, and privacy answers.

## 12. Publish

- [ ] Start the production rollout.
- [ ] Monitor review status and post-release feedback.
