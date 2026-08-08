# Basketball Points Counter App

![Flutter](https://img.shields.io/badge/Framework-Flutter-02569B)
![Dart](https://img.shields.io/badge/Language-Dart-0175C2)

> A real-time two-team basketball scoreboard. Tap the +1 / +2 / +3 buttons to update Team A or Team B — reset anytime.

## Features

- Two-team scoreboard (Team A & Team B) with live counter
- `+1`, `+2`, `+3` scoring buttons per team
- Reset button to zero out both teams
- Orange gradient theme with high-contrast score display

## Project Structure

```
basketball_points_counter_app/
└── lib/
    └── main.dart           # BasketballPointsCounterApp (StatefulWidget)
```

## Getting Started

```bash
cd basketball_points_counter_app
flutter pub get
flutter run
```

## Design

See [DESIGN.md](./DESIGN.md) for colors, typography, and layout decisions.

## Dependencies

| Package | Version |
|---|---|
| `flutter` | SDK `^3.12.2` |
| `cupertino_icons` | `^1.0.8` |