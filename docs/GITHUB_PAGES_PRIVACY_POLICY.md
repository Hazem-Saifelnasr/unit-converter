# GitHub Pages Privacy Policy Guide

This guide explains how to publish the app privacy policy at a free public URL using GitHub Pages.

## Files To Use

- Source text: `docs/PRIVACY_POLICY.md`
- Host-ready page: `release-assets/privacy-policy/index.html`

## Step By Step

1. Push this repository to GitHub if it is not already there.
2. Make sure `release-assets/privacy-policy/index.html` is committed and pushed.
3. Open the repository on GitHub.
4. Go to `Settings` -> `Pages`.
5. In `Build and deployment`, set `Source` to `Deploy from a branch`.
6. Choose the branch you want to publish from, usually `main`.
7. In the folder selector, choose `/root`.
8. Click `Save`.
9. Wait for GitHub Pages to finish deployment.
10. Open the published site URL shown by GitHub Pages.
11. Append `/release-assets/privacy-policy/` to that site URL.

Example:

```text
https://<github-username>.github.io/<repository-name>/release-assets/privacy-policy/
```

12. Open that final URL in a private browser window to confirm it loads without login.
13. Paste that exact URL into Google Play Console `Privacy policy`.

## Notes

- If you rename the repository, the GitHub Pages URL also changes.
- If you update the policy text later, update both `docs/PRIVACY_POLICY.md` and `release-assets/privacy-policy/index.html`, then push again.
- GitHub Pages may take a few minutes to publish updates.
