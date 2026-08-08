# News App

![Flutter](https://img.shields.io/badge/Framework-Flutter-02569B)
![Dart](https://img.shields.io/badge/Language-Dart-0175C2)
![API](https://img.shields.io/badge/API-NewsAPI-1DA1F2)

> A dark-themed, category-based news reader. Browse headlines in 7 categories, search within a category, and open full articles in a WebView — all powered by the [NewsAPI](https://newsapi.org/).

## Features

- **7 news categories**: Business, Entertainment, General, Health, Science, Sports, Technology
- Category grid home screen with icon cards
- Live headlines list with search/filter inside each category
- Article detail opened in an in-app WebView
- **Dark theme** with navy canvas (`#1A1A2E`) and red accent (`#E94560`)
- `Provider`-based state management + `Dio` client for API calls

## Project Structure

```
lib/
├── main.dart                    # Entry — global Dio instance
├── constants/ (config)
├── screens/
│   ├── homepage_screen.dart     # Category grid
│   ├── category_screen.dart     # Headlines per category
│   └── webview_screen.dart      # Article detail in WebView
├── components/
│   ├── categorieslistview.dart  # Category list
│   ├── category_card.dart       # Category tile
│   ├── newslistview.dart        # Headlines list
│   ├── news_tile.dart           # Headline tile
│   ├── headline_widget.dart     # Typography helper
│   └── error_message.dart       # Error state
├── models/
│   ├── article_model.dart       # API article
│   └── category_model.dart      # Category
├── services/
│   └── news_services.dart       # NewsAPI client
└── viewmodels/
    ├── news_view_model.dart     # Provider state
    └── search_view_model.dart   # Search state (category screen)
```

## Getting Started

```bash
cd news_app
flutter pub get

# Set your NewsAPI key (see services/news_services.dart)
flutter run
```

## Design

Full design system in [DESIGN.md](./DESIGN.md).

## Dependencies

| Package | Version | Purpose |
|---|---|---|
| `flutter` | SDK `^3.12.2` | Core |
| `dio` | `^5.10.0` | HTTP client |
| `provider` | `^6.1.5+1` | State management |
| `webview_flutter` | `^4.14.1` | Article viewer |
| `cupertino_icons` | `^1.0.8` | Icons |