# Documentation

This directory contains the project planning and release documents for the Android version of Unit Converter.

## Files

- `PRD.md`: product requirements and scope for the first release
- `RELEASE_CHECKLIST.md`: current release gate with verified items, pending work, and manual QA steps
- `RELEASE_PACKAGING.md`: step-by-step release packaging guide for signing, builds, icons, screenshots, and store prep
- `RELEASE_PACKAGING_CHECKLIST.md`: strict checkbox runbook for release packaging
- `GOOGLE_PLAY_PUBLISHING.md`: step-by-step Play Console publishing guide after packaging is complete
- `GOOGLE_PLAY_PUBLISHING_CHECKLIST.md`: strict checkbox list for Google Play submission
- `PRIVACY_POLICY.md`: privacy policy source text to host at a public URL for Play Console
- `GITHUB_PAGES_PRIVACY_POLICY.md`: step-by-step guide to publish the privacy policy for free with GitHub Pages
- `GITHUB_PAGES_PRIVACY_POLICY_CHECKLIST.md`: strict checklist for the GitHub Pages privacy policy flow

## Current Implementation Notes

- Platform scope is Android only.
- The app supports light and dark themes with an app-bar toggle.
- Recent conversions can be expanded, collapsed, restored, and deleted.
- Automated verification currently includes `flutter analyze` and `flutter test`.
