# PRD — Unit Converter Mobile App
Version: 1.0
Platform: Android (Flutter)
Document Owner: Product / Engineering
Status: Ready for implementation

## 1. Product Overview

### 1.1 Product Name
Unit Converter

### 1.2 Product Goal
Build a very small, polished, legitimate utility mobile app that performs common unit conversions offline. The app should be simple enough to implement and maintain quickly, while still feeling real, useful, and publishable on Google Play.

### 1.3 Business Goal
The app should serve as a lightweight, legitimate Google Play app that can be published, maintained, and improved over time. It must not feel empty, fake, or like placeholder content.

### 1.4 Product Principles
- Small scope
- Real utility
- Offline-first
- Low-maintenance
- Clean UI
- Stable and production-ready
- Play Store friendly
- Easy to extend later

---

## 2. Problem Statement

Users often need quick conversions between common measurement units such as length, weight, temperature, area, volume, and speed. Many apps are bloated, ad-heavy, or require internet access. This app should provide a fast, simple, accurate, offline solution.

---

## 3. Target Users

### 3.1 Primary Users
- General users who need quick daily conversions
- Students
- Travelers
- DIY users
- Professionals needing simple measurement conversion on the go

### 3.2 User Needs
- Enter a value quickly
- Choose source and target units easily
- See result instantly
- Use app without internet
- Trust the output
- Reuse recent conversions

---

## 4. Scope

### 4.1 In Scope
The first release must include:
- Unit conversion by category
- From-unit and to-unit selection
- Numeric input
- Instant result display
- Swap units action
- Copy result action
- Clear input action
- Recent conversion history
- Light and dark theme support
- Material 3 UI
- Fully offline functionality

### 4.2 Out of Scope
The first release must NOT include:
- Authentication
- Cloud sync
- Ads
- In-app purchases
- User accounts
- Backend
- Online APIs
- Currency conversion
- Complex scientific calculation features
- Tablet-first layouts
- Multi-language support unless easy to add later

---

## 5. Functional Requirements

## 5.1 Categories
The app must support these conversion categories in v1:
1. Length
2. Weight / Mass
3. Temperature
4. Area
5. Volume
6. Speed

## 5.2 Conversion Flow
The user must be able to:
1. Select a category
2. Select a source unit
3. Select a target unit
4. Enter a numeric value
5. View converted result instantly

## 5.3 Unit Selection
- Each category must have an appropriate list of units
- Unit labels must be user-friendly
- Default unit selections should be reasonable
- Users must be able to change units easily

## 5.4 Swap Units
- A swap button must switch the from-unit and to-unit
- After swapping, the result must update immediately

## 5.5 Input Handling
- Users must be able to enter integers and decimals
- Invalid input must be handled gracefully
- Empty input should not crash or produce confusing output
- Input field should support numeric keyboard

## 5.6 Result Display
- Result must update instantly when input or unit selection changes
- Result display must be visually prominent
- Output formatting must be readable and clean

## 5.7 Output Formatting
- Whole numbers should display without unnecessary decimal places
- Decimal outputs should be rounded intelligently
- Avoid ugly floating-point artifacts in display
- Precision should feel natural for normal user needs

## 5.8 Temperature Conversion
Temperature conversion must use proper formulas, not just multiplier-based logic.

Examples:
- Celsius ↔ Fahrenheit
- Celsius ↔ Kelvin
- Fahrenheit ↔ Kelvin

## 5.9 Copy Result
- User must be able to copy the displayed result to clipboard
- App should provide feedback when copied

## 5.10 Clear Input
- User must be able to clear the input quickly
- Clearing input should also refresh or reset the result state appropriately

## 5.11 Recent History
- Store a simple recent conversion history locally
- History should show latest conversions first
- History can be limited to a small number such as 10–20 entries
- Users do not need account or sync for history
- History persistence may be local only

## 5.12 Empty and Error States
The app must handle:
- Empty input
- Invalid numeric input
- Missing selection states
- Very small or very large values, as practical

---

## 6. Non-Functional Requirements

## 6.1 Platform
- Flutter latest stable
- Dart latest stable
- Android-first delivery

## 6.2 Offline Support
- Core functionality must work 100% offline
- No network dependency for conversions

## 6.3 Performance
- Result updates should feel instant
- App startup should be fast
- App should remain lightweight

## 6.4 Reliability
- App must not crash during normal usage
- Conversion logic must be deterministic and testable

## 6.5 Maintainability
- Codebase must be clean and easy to extend
- Architecture should be simple, not overengineered
- Logic must be separated clearly from UI

## 6.6 Privacy
- App should collect no personal data in v1
- App should require minimal or no permissions

---

## 7. UX / UI Requirements

## 7.1 Design Direction
- Clean
- Minimal
- Modern
- Utility-focused
- Not overdesigned
- Material 3 compliant

## 7.2 Main Screen Layout
The home screen should include:
- App title/header
- Category selector near top
- Input field for value
- From-unit selector
- To-unit selector
- Swap action
- Large result area
- Copy result action
- Clear input action
- Recent history section

## 7.3 Themes
- Light theme required
- Dark theme required
- Theme behavior should be polished and readable in both modes

## 7.4 Responsiveness
- Must look good on normal phone screens
- Layout should avoid crowding
- Important content should remain visible without confusion

## 7.5 Accessibility Basics
- Clear labels
- Sufficient text readability
- Tap targets should be usable
- Avoid ambiguous icons without context

---

## 8. Suggested Units by Category

Codex should implement a practical initial unit set such as:

### 8.1 Length
- Millimeter
- Centimeter
- Meter
- Kilometer
- Inch
- Foot
- Yard
- Mile

### 8.2 Weight / Mass
- Milligram
- Gram
- Kilogram
- Ton
- Ounce
- Pound

### 8.3 Temperature
- Celsius
- Fahrenheit
- Kelvin

### 8.4 Area
- Square meter
- Square kilometer
- Square foot
- Square yard
- Acre
- Hectare

### 8.5 Volume
- Milliliter
- Liter
- Cubic meter
- Cup
- Pint
- Gallon

### 8.6 Speed
- Meter per second
- Kilometer per hour
- Mile per hour
- Knot

Codex may adjust unit lists slightly if needed, but should keep the app small and useful.

---

## 9. Technical Requirements

## 9.1 Architecture
Use a simple but professional architecture with clear separation of:
- UI / presentation
- Models
- Conversion logic
- State management
- Local persistence for history

## 9.2 State Management
Choose a lightweight, clean solution.
Preferred:
- Riverpod

Alternative:
- Provider

Use the simplest clean option that keeps code organized.

## 9.3 Storage
Use lightweight local storage for recent history.
Examples:
- SharedPreferences
- Hive
- Simple local persistence approach

Choose the easiest reliable option.

## 9.4 Code Quality
- Complete code only
- No pseudo-code
- No unnecessary abstraction
- Avoid overengineering
- Keep files readable
- Add comments only where useful

## 9.5 Build Readiness
Project should compile and run with standard Flutter tooling.

---

## 10. Folder Structure Expectations

Codex should propose and implement a clean structure such as:

- lib/
    - app/
    - core/
    - features/converter/
        - data/
        - domain/
        - presentation/
    - main.dart

This does not need full enterprise complexity. Keep it small and clean.

---

## 11. Google Play Readiness Requirements

The app must be designed for low-friction Play Store submission.

### 11.1 App Identity
- App name: Unit Converter
- Use a valid production-friendly package name

### 11.2 Permissions
- Keep permissions minimal or none if possible

### 11.3 Policy Simplicity
Avoid features that create unnecessary policy complexity:
- no account creation
- no user-generated content
- no external integrations
- no sensitive permissions
- no deceptive behavior

### 11.4 Privacy Position
Include a simple privacy statement in the README stating that:
- the app does not collect personal data
- conversions happen on-device
- no account is required

### 11.5 Store Listing Support
Codex must provide suggested:
- Play Store title
- short description
- full description

---

## 12. Deliverables

Codex must output:

1. Full Flutter project code
2. Recommended folder structure
3. pubspec.yaml with dependencies
4. All required Dart source files
5. README.md containing:
    - project overview
    - setup instructions
    - build/run instructions
    - how to generate APK/AAB
    - suggested Play Store title
    - suggested short description
    - suggested full description
    - simple privacy policy text
6. RELEASE_CHECKLIST.md containing:
    - pre-release review items
    - Play Console listing assets needed
    - content rating guidance
    - Data Safety guidance for an offline no-data-collection app
7. App icon guidance
8. Suggested small future improvements

---

## 13. Future Enhancements

Not required for v1, but Codex should suggest future small updates such as:
- Favorite conversions
- More units
- Better formatting options
- Currency category later
- Unit search
- Category icons
- Home screen widget if later desired

---

## 14. Acceptance Criteria

The app is accepted when:
- It compiles successfully
- It runs fully offline
- All 6 categories work
- Conversion results are accurate
- Temperature formulas are correct
- Swap button works
- Copy result works
- Clear input works
- Recent history works
- UI is clean and not broken in light/dark mode
- Code structure is organized and maintainable
- README and release checklist are included
- App feels like a legitimate publishable utility app

---

## 15. Implementation Instructions for Codex

Please implement this PRD as a real Flutter project.

Execution order:
1. Briefly propose final folder structure
2. Generate the full project files
3. Generate README.md
4. Generate RELEASE_CHECKLIST.md
5. Provide final run/build/publish instructions

Important implementation rules:
- Keep scope tight
- Prefer clarity over cleverness
- Do not overengineer
- Do not add unnecessary features
- Ensure the app feels polished despite small scope