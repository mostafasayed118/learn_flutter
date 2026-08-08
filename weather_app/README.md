# Weather App

![Flutter](https://img.shields.io/badge/Framework-Flutter-02569B)
![Dart](https://img.shields.io/badge/Language-Dart-0175C2)
![State](https://img.shields.io/badge/State-Bloc-673AB7)

> A minimalist weather application. Search for a city and view its current temperature, condition, and last-updated time — with the app theme adapting to the weather.

## Features

- **City search** — search view with progress/error handling
- **Current weather display** — city, time, temperature (formatted with `intl`), and condition
- **Dynamic theming** — body color adapts to the current weather condition (e.g., sunny, rainy)
- **Empty state** — friendly "no weather data" screen guiding users to search
- State management with **flutter_bloc** (Cubit) + **Dio** HTTP client

## Project Structure

```
lib/
├── main.dart                      # Entry — BlocProvider + BlocBuilder + theme
├── constants/
│   └── app_constants.dart         # Strings & endpoint URLs
├── cubits/
│   └── get_weather_cubit/
│       ├── get_weather_cubit.dart
│       └── get_weather_states.dart
├── models/
│   └── weather_model.dart         # Weather data model
├── services/
│   └── weather_service.dart       # API client (Dio)
├── utils/
│   └── theme_utils.dart           # Weather → theme color
├── views/
│   ├── home_view.dart             # Weather / no-weather screen
│   └── search_view.dart           # City search
└── widgets/
    ├── custom_text_widget.dart
    ├── no_weather_body_widget.dart
    ├── row_data_of_weather_widget.dart
    └── weather_infobody_widget.dart
```

## Getting Started

```bash
cd weather_app
flutter pub get
flutter run
```

> The API base URL is defined in `lib/constants/app_constants.dart`.

## Design

Minimalist palette (`#2196F3` primary, white canvas, grey mute) and typography scale are documented in [DESIGN.md](./DESIGN.md).

> ⚠️ This is the *finished* solution. The original course starter scaffold lives in [`weather_app_setup-main`](../weather_app_setup-main/).

## Dependencies

| Package | Version | Purpose |
|---|---|---|
| `flutter` | SDK `^3.12.2` | Core |
| `dio` | `^5.7.0` | HTTP client |
| `flutter_bloc` | `^9.1.1` | State management |
| `intl` | `^0.19.0` | Date/time formatting |
| `cupertino_icons` | `^1.0.8` | Icons |