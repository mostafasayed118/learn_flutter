# Tones Layer App

![Flutter](https://img.shields.io/badge/Framework-Flutter-02569B)
![Dart](https://img.shields.io/badge/Language-Dart-0175C2)

> A rainbow xylophone — seven colored full-width pads, each playing a distinct note on tap. Powered by `audioplayers`.

## Features

- **7 colored pads** spanning the full screen (rainbow order) — no gap
- Tap a pad to play its note (`assets/note1.wav` … `note7.wav`)
- Simple scalable architecture: `TuneModel` + `TuneItem` component

## Project Structure

```
lib/
├── main.dart                  # Entry
├── screens/
│   └── homepage.dart          # Xylophone screen
├── components/
│   └── tune_item.dart         # One colored tappable pad
└── models/
    └── tune_model.dart        # Note → WAV file mapping
```

## Getting Started

```bash
cd tunes_layer_app
flutter pub get
flutter run
```

## Design

Color, note mapping, and spacing spec in [DESIGN.md](./DESIGN.md).

## Dependencies

| Package | Version | Purpose |
|---|---|---|
| `flutter` | SDK `^3.12.2` | Core |
| `audioplayers` | `^6.8.1` | Play notes |
| `cupertino_icons` | `^1.0.8` | Icons |