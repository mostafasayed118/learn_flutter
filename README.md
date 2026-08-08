# Learn Flutter

![Flutter](https://img.shields.io/badge/Framework-Flutter-02569B)
![Dart](https://img.shields.io/badge/Language-Dart-0175C2)
![Status](https://img.shields.io/badge/Finalized_Projects-9%20✅-blue)

> A collection of **Flutter projects** — from Hello World to production-style apps (chat, news, weather) — built while learning Flutter. Each project is self-contained with source code, assets, and design system documentation.

---

## Projects

| # | Project | Status | Description |
|---|---|---|---|
| 1 | [First Project](./first_project/) | ✅ Completed | Hello World layout — four colored containers in a Row |
| 2 | [Birthday Card App](./birthday_card_app/) | ✅ Completed | A pastel digital birthday card with full-screen cake image |
| 3 | [Business Card App](./business_card_app/) | ✅ Completed | Personal digital business card with Pacifico cursive font |
| 4 | [Basketball Points Counter](./basketball_points_counter_app/) | ✅ Completed | Real-time two-team basketball scoreboard |
| 5 | [Language Learning App](./language_learning_app/) | ✅ Completed | Japanese-English vocabulary with audio pronunciation |
| 6 | [News App](./news_app/) | ✅ Completed | Dark-themed category-based news reader with NewsAPI |
| 7 | [Chat App](./chat_app/) | ✅ Completed | Firebase chat: email/password auth + real-time Firestore messages |
| 8 | [Tones Layer App](./tunes_layer_app/) | ✅ Completed | Rainbow xylophone pad — tap to play tones |
| 9 | [Weather App](./weather_app/) | ✅ Completed | Minimalist app displaying current weather conditions |
| 10 | [Weather App (Setup Starter)](./weather_app_setup-main/) | 🟡 Starter | The original course scaffold the Weather App was built from |
| 11 | [Simple Todo & Timer](./simple_todo_timer_app/) | 🚧 In Progress | Clean-architecture todo + timer app (early scaffold) |

---

## Tech Stack

- **Framework**: Flutter
- **Language**: Dart
- **Packages**: `audioplayers` (Language Learning, Tones Layer), `dio` (News, Weather), `provider` (News), `webview_flutter` (News), `flutter_bloc` (Weather), `intl` (Weather), `firebase_core`, `firebase_auth`, `cloud_firestore` (Chat)
- **Fonts**: Pacifico (Business Card)
- **Platforms**: Android, iOS, Web, Windows, macOS, Linux

---

## Each Project Includes

- `lib/` — Dart source code
- `README.md` — Project overview, features, and run instructions
- `DESIGN.md` — Design system documentation (colors, typography, layout, components) — *except Chat App*
- `pubspec.yaml` — Dependencies and asset declarations
- `assets/` — Images, sounds, and fonts (where applicable)

---

## Getting Started

```bash
# Clone the repository
git clone https://github.com/mostafasayed118/learn_flutter.git
cd learn_flutter

# Run any project
cd <project_directory>
flutter pub get
flutter run
```

### Notes

- The **News App** and **Weather App** require an API key (`NEWS_API_KEY` / weather service key) configured in code or environment.
- The **Chat App** requires a Firebase project. Generate your own `firebase_options.dart` via `flutterfire configure` and enable Email/Password auth plus Cloud Firestore.
- `weather_app_setup-main` is the pre-solution starter scaffold; prefer the finished solution in [`weather_app`](./weather_app/).

---

## Design Documentation

Most projects include a `DESIGN.md` file following the [awesome-design-md](https://github.com/VoltAgent/awesome-design-md) format. These files define:

- 🎨 **Colors** — semantic palette with hex values
- 🔤 **Typography** — font families, sizes, weights
- 📐 **Layout** — spacing, grid, responsive strategy
- 🧩 **Components** — reusable UI element specifications
- ✅ **Do's and Don'ts** — design guardrails