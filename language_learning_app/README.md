# Language Learning App

![Flutter](https://img.shields.io/badge/Framework-Flutter-02569B)
![Dart](https://img.shields.io/badge/Language-Dart-0175C2)
![Audio](https://img.shields.io/badge/Audio-audioplayers-7B68EE)

> A Japanese → English vocabulary app with images and native audio pronunciation.

## Features

- **4 categories**: Numbers, Family Members, Colors, Phrases
- Scrollable word lists with images and translations
- Tap any item to hear the Japanese pronunciation (via `audioplayers`)
- Reusable components: `CategoryItem`, `ItemList`, `PhraseItem`, custom icon buttons

## Project Structure

```
lib/
├── main.dart                      # App entry
├── screens/
│   ├── home_page.dart             # Category home
│   ├── numbers.dart               # Numbers category
│   ├── family_members.dart        # Family category
│   ├── colors.dart                # Colors category
│   └── phrases.dart               # Phrases category
├── components/
│   ├── catgory_item.dart          # Category card
│   ├── item_list.dart             # Word list tile
│   ├── phrase_item.dart           # Phrase tile
│   └── icon_button.dart           # Custom action button
└── models/
    └── DataModel.dart             # Word/phrase data model
```

## Assets

- `assets/images/` — numbers, family_members, colors
- `assets/sounds/` — native audio clips for numbers, family_members, colors, phrases

## Getting Started

```bash
cd language_learning_app
flutter pub get
flutter run
```

## Design

Color palette (warm earthy + 4 category accents) and typography: [DESIGN.md](./DESIGN.md).

## Dependencies

| Package | Version | Purpose |
|---|---|---|
| `flutter` | SDK `^3.12.2` | Core |
| `audioplayers` | `^6.8.1` | Audio pronunciation |
| `cupertino_icons` | `^1.0.8` | Icons |