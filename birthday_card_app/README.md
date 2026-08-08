# Birthday Card App

![Flutter](https://img.shields.io/badge/Framework-Flutter-02569B)
![Dart](https://img.shields.io/badge/Language-Dart-0175C2)

> A pastel digital birthday card with a full-screen birthday cake image and a warm "Happy Birthday" message.

## Features

- Full-screen lavender canvas (`#D3BCD6`)
- Birthday cake image centered on screen — **Happy Birthday** greeting
- Simple, static `StatelessWidget` — a clean first exercise in layout & assets

## Screenshots

*Coming soon — project does not ship preview images yet.*

## Project Structure

```
birthday_card_app/
├── lib/
│   └── main.dart          # BirthdayCardApp — centered cake image card
└── images/
    └── birthday_cake.webp # Cake asset
```

## Getting Started

```bash
cd birthday_card_app
flutter pub get
flutter run
```

## Design

Colors, typography, and layout specs live in [DESIGN.md](./DESIGN.md).

## Dependencies

| Package | Purpose |
|---|---|
| `flutter` | Core framework |
| `cupertino_icons` | iOS-style icons |