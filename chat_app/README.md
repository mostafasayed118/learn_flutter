# Chat App

![Flutter](https://img.shields.io/badge/Framework-Flutter-02569B)
![Dart](https://img.shields.io/badge/Language-Dart-0175C2)
![Firebase](https://img.shields.io/badge/Backend-Firebase-FFCA28)

> A real-time chat application with Firebase Authentication (email/password) and Cloud Firestore messaging. Sign up, sign in, and exchange messages in live chat bubbles.

## Features

- **Firebase Auth** — email/password sign-up and sign-in with `modal_progress_hud` loading states
- **Cloud Firestore** — real-time message sync; new messages appear instantly
- Chat bubbles UI (own vs. other users' messages are visually distinct)
- Input validation + snackbar error feedback
- Named routes with a centralized MaterialApp theme (`core/app_theme.dart`)

## Project Structure

```
lib/
├── main.dart                  # Entry — Firebase init, routes, theme
├── core/
│   ├── app_assets.dart        # Asset paths
│   ├── app_colors.dart        # Color tokens
│   ├── app_constans.dart      # App-wide constants
│   ├── app_theme.dart         # Material 3 theme
│   └── validators.dart        # Form validators
├── helper/
│   └── showsnackbar.dart      # Snackbar helper
├── models/
│   └── message.dart           # Chat message model
├── screens/
│   ├── chat_screen.dart       # Live chat
│   ├── sign_in_screen.dart    # Sign in
│   └── sign_up_screen.dart    # Sign up
├── widgets/
│   ├── chat_bubble.dart       # Message bubble
│   ├── custom_button.dart     # Primary button
│   ├── custom_text.dart       # Typography helper
│   └── custom_textfield.dart  # Input field
└── firebase_options.dart      # Generated Firebase config
```

## Setup

The app needs a Firebase project:

```bash
# 1. Create a Firebase project at https://console.firebase.google.com
# 2. Add Android / iOS / Web app and enable:
#    - Authentication → Email/Password
#    - Firestore Database
# 3. Regenerate the config for your project:
flutterfire configure
```

Then run:

```bash
cd chat_app
flutter pub get
flutter run
```

## Design

The design system is documented inline in the repo (`DESIGN.md` is intentionally not shipped — see `README` history for the original design doc). Color tokens, theme, and bubble styles live in `lib/core/`.

## Dependencies

| Package | Version | Purpose |
|---|---|---|
| `flutter` | SDK `^3.12.2` | Core |
| `firebase_core` | `^4.12.1` | Firebase bootstrap |
| `firebase_auth` | `^6.5.6` | Email/password auth |
| `cloud_firestore` | `^6.7.1` | Real-time messages |
| `modal_progress_hud_nsn` | `^0.5.1` | Loading overlay |
| `cupertino_icons` | `^1.0.8` | Icons |