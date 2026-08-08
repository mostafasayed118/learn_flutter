# Business Card App

![Flutter](https://img.shields.io/badge/Framework-Flutter-02569B)
![Dart](https://img.shields.io/badge/Language-Dart-0175C2)

> A personal digital business card — blue canvas, circular profile avatar, and contact info in the Pacifico cursive font.

## Features

- Blue (`#79A3EB`) canvas with a circular logo avatar
- Name rendered in the **Pacifico** cursive font
- White contact cards for phone, email, and website
- Reusable `Card` / column layout taught in the Basics course

## Project Structure

```
business_card_app/
├── assets/
│   ├── fonts/
│   │   └── Pacifico-Regular.ttf   # Custom font
│   └── images/
│       └── logo.png               # Avatar image
└── lib/
    └── main.dart                   # BusinessCardApp
```

## Getting Started

```bash
cd business_card_app
flutter pub get
flutter run
```

## Design

Full color palette, typography, and contact-card component specs: [DESIGN.md](./DESIGN.md).

## Dependencies

| Package | Purpose |
|---|---|
| `flutter` | Core framework |
| `cupertino_icons` | iOS-style icons |
| **Fonts** | `Pacifico` (assets/fonts) |