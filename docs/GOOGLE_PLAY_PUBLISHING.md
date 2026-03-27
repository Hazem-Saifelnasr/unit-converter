# Google Play Publishing Guide

This document covers the steps after release packaging is complete and the signed Android App Bundle is ready. For this Play Console account, direct production rollout is not available yet. The required path is: finish setup, run a closed test, keep at least 12 testers opted in for 14 days, then apply for production access.

## 1. Create The App In Google Play Console

1. Sign in to Google Play Console.
2. Click `Create app`.
3. Enter the app name: `Unit Converter`.
4. Choose the default app language.
5. Select `App`.
6. Choose whether the app is free or paid.
7. Confirm the Play Console declarations and create the app entry.

## 2. Internal Testing Is Optional

1. Open the app in Play Console.
2. Go to `Testing` -> `Internal testing` if you want a quick pre-check on your own devices.
3. Create a new release.
4. Upload the signed bundle:

```text
releases/android/1.0.0+1/unit-converter-1.0.0+1-release.aab
```

5. Select testers and roll out the release.
6. Use this only for quick verification. It does not unlock production access.

## 3. Finish Setting Up The App

1. Open the app `Dashboard`.
2. Open `Policy and programs` or `App content`, depending on the current Play Console layout.
3. Complete `Privacy policy`.
   Use the policy text in `docs/PRIVACY_POLICY.md`.
   Host that exact text on a public page, then paste the final public URL into Play Console.
   Keep the hosted page content identical to `docs/PRIVACY_POLICY.md`.
   If you want a free option, use the GitHub Pages steps in `docs/GITHUB_PAGES_PRIVACY_POLICY.md`.
4. Complete `App access`.
   Select `All functionality is available without special access` because this app has no login, no account, and no gated content.
5. Complete `Ads`.
   Select `No`, because the app does not show ads.
6. Complete `Content rating`.
   Start the questionnaire, answer based on a simple offline utility app, then submit it.
7. Complete `Target audience`.
   Choose the audience that fits a general measurement utility app and answer the follow-up questions truthfully.
8. Complete `Data safety`.
   Use the answers in section `6` of this guide.
9. Complete `Government apps`.
   Select `No`, because this app is not an official government app.
10. Complete `Financial features`.
    Select `No`, because this app does not provide financial products or services.
11. Complete `Health`.
    Select `No`, because this app is not a health or medical app.
12. Open the category and contact details area.
13. Select the app category that best fits this app, typically `Tools`.
14. Set the public support email to `hazem.saifelnasr@gmail.com`.
15. Open the store listing section and fill in the public-facing metadata from the next section.
16. Do not start the closed test until Play Console shows setup is complete enough to proceed.

## 4. Complete The Store Listing

1. Open `Store presence` or `Main store listing`.
2. Set the title to `Unit Converter`.
3. Set the short description to:

```text
Fast offline unit conversions for daily measurements.
```

4. Set the full description to:

```text
Unit Converter is a clean, lightweight utility for quick daily conversions. Convert length, weight, temperature, area, volume, and speed instantly with an offline-first experience, recent history, result copy, unit swap, and a polished Material 3 interface.
```

5. Upload the app icon if Play Console asks for a high-resolution store icon.
6. Upload screenshots from:

```text
release-assets/screenshots/
```

7. Set the support email to:

```text
hazem.saifelnasr@gmail.com
```

8. Save the store listing.

## Privacy Policy Hosting Note

1. The privacy policy source for this repo is:

```text
docs/PRIVACY_POLICY.md
```

2. Publish that text on a public page such as GitHub Pages, your own site, or another static hosting service.
3. Make sure the page is reachable without login.
4. Copy the final public URL into Play Console `Privacy policy`.
5. If you update the policy later, update both the hosted page and `docs/PRIVACY_POLICY.md`.
6. For a free GitHub Pages flow, use `docs/GITHUB_PAGES_PRIVACY_POLICY.md`.

## 5. Complete App Content

1. Go to `App content`.
2. Open `Privacy policy` and provide the final privacy policy URL if Play Console requires one.
3. Open `App access` and choose `No restrictions` or the equivalent option that says all functionality is available without login.
4. Open `Ads` and choose `No`.
5. Complete the content rating questionnaire and submit it.
6. Complete the target audience section.
7. Confirm the app is not a news app if that declaration appears.
8. Set `Government apps` to `No`.
9. Set `Financial features` to `No`.
10. Set `Health` to `No`.
11. Complete any other required app-content declarations shown for the account.

## 6. Complete Data Safety And Privacy

1. Open `Data safety`.
2. Select `No` for data collection if Play Console allows the simplified flow.
3. If Play Console shows the detailed form instead, declare that the app does not collect data and does not share data.
4. Do not claim account creation, analytics, crash reporting, advertising, or external data transfer because this app does not use them.
5. Keep the answers aligned with the privacy statement in `README.md`.
6. Save the section and confirm there are no remaining warnings for Data safety.

## 7. Set Up Closed Testing

1. Open `Testing` -> `Closed testing`.
2. Create the closed test track if Play Console has not created one already.
3. Select the countries and regions where the test should be available.
4. Add the tester list.
5. Make sure at least `12 testers` opt in to the closed test.
6. Create a new release and upload:

```text
releases/android/1.0.0+1/unit-converter-1.0.0+1-release.aab
```

7. Review and confirm the release.
8. Send the closed test release to Google for review if prompted.
9. Keep the closed test running for at least `14 days` with at least `12 opted-in testers`.

## 8. Apply For Production Access

1. Return to the app `Dashboard` after the closed test criteria are met.
2. Open the production access prompt.
3. Answer the Play Console questions about the closed test honestly and specifically.
4. Submit the production access application.
5. Wait for Google Play to grant production access before preparing the production rollout.

## 9. Set Pricing And Distribution

1. Open `Pricing and distribution` or the current equivalent Play Console section.
2. Select the countries or regions where the app should be available.
3. Confirm whether the app is free or paid.
4. Review any device availability notes shown by Play Console.

## 10. Prepare The Production Release

1. Add release notes for version `1.0.0+1`.
2. Verify the uploaded `.aab` is attached to the release.
3. Review all Play Console warnings and errors.
4. Fix anything blocking rollout before continuing.

## 11. Publish

1. Review the entire store listing one final time.
2. Review screenshots, icon, descriptions, support email, and data safety answers.
3. Start the production rollout.
4. Monitor Play Console for review status, policy feedback, or rollout issues.
