---
version: alpha
name: News-App-Design
description: A dark-themed news reader app — deep navy canvas, red accent highlights, category grid with icon assets, real-time headlines from NewsAPI, and article detail via WebView.

colors:
  primary: "#1A1A2E"
  on-primary: "#FFFFFF"
  accent: "#E94560"
  accent-on: "#FFFFFF"
  canvas: "#0F3460"
  canvas-soft: "#16213E"
  ink: "#FFFFFF"
  body: "#A0B3D0"
  mute: "#5C6B8A"
  hairline: "#2A3A5C"
  category-business: "#FFB74D"
  category-entertainment: "#E91E63"
  category-general: "#607D8B"
  category-health: "#4CAF50"
  category-science: "#7C4DFF"
  category-sports: "#FF5722"
  category-technology: "#00BCD4"
  selection-bg: "#E94560"
  selection-fg: "#FFFFFF"

typography:
  appbar-title:
    fontFamily: system-ui, -apple-system, sans-serif
    fontSize: 20px
    fontWeight: 600
    lineHeight: 28px
  body:
    fontFamily: system-ui, -apple-system, sans-serif
    fontSize: 16px
    fontWeight: 400
    lineHeight: 24px
  caption:
    fontFamily: system-ui, -apple-system, sans-serif
    fontSize: 12px
    fontWeight: 400
    lineHeight: 16px

rounded:
  none: 0px
  sm: 4px
  md: 8px
  lg: 12px

spacing:
  xs: 8px
  sm: 12px
  md: 16px
  lg: 24px
  xl: 32px

components:
  appbar:
    backgroundColor: "{colors.primary}"
    titleColor: "{colors.ink}"
    titleTypography: "{typography.appbar-title}"
  category-icon:
    size: 48px
    shape: "{rounded.md}"
  skeleton-card:
    backgroundColor: "{colors.canvas}"
    shape: "{rounded.md}"
    padding: "{spacing.lg}"
    textColor: "{colors.body}"
    typography: "{typography.body}"
  page:
    backgroundColor: "{colors.canvas-soft}"

---

## Overview

A dark-themed news reader app with real-time article fetching from the NewsAPI. The homepage displays a horizontal scrollable category selector and a list of top headlines. Tapping a category loads category-specific articles. Tapping an article opens it in an in-app WebView for full reading.

## Features

- **Category Grid**: 7 news categories (Business, Entertainment, General, Health, Science, Sports, Technology) with dedicated color-coded icon assets (`.jpeg` format).
- **Real-time Headlines**: Fetches top US headlines from NewsAPI via `Dio` HTTP client.
- **Article List**: Scrollable list of news tiles showing headline, description, and thumbnail image.
- **WebView Detail**: In-app `webview_flutter` for reading full articles without leaving the app.
- **MVVM Architecture**: Clean separation with `models/`, `services/`, `viewmodels/`, `screens/`, and `components/`.
- **State Management**: `Provider` + `ChangeNotifier` for reactive UI updates.

## Architecture

```
lib/
├── main.dart                    # App entry, Dio instance, MaterialApp
├── models/
│   ├── article_model.dart       # Article data class with JSON mapping
│   └── category_model.dart      # Category data class
├── services/
│   └── news_services.dart       # NewsAPI HTTP calls via Dio
├── viewmodels/
│   └── news_view_model.dart     # ChangeNotifier managing news state
├── screens/
│   ├── homepage_screen.dart     # Main screen with categories + headlines
│   ├── category_screen.dart     # Category-specific article list
│   └── webview_screen.dart      # In-app article reader
└── components/
    ├── category_card.dart       # Category icon card widget
    ├── categorieslistview.dart  # Horizontal category scroll list
    ├── newslistview.dart        # Vertical news article list
    ├── news_tile.dart           # Individual news article card
    ├── hadline_widget.dart      # AppBar headline title widget
    └── error_message.dart       # Error state display widget
```

## Dependencies

| Package | Purpose |
|---|---|
| `dio` | HTTP client for NewsAPI requests |
| `provider` | State management via ChangeNotifier |
| `webview_flutter` | In-app article reading |

## Colors

### Brand & Accent
- **Deep Navy** (`#1A1A2E`): AppBar and dark surface.
- **Red Accent** (`#E94560`): Highlights, active states, and interactive accents.

### Surface
- **Canvas** (`#0F3460`): Primary page background — rich dark blue.
- **Canvas Soft** (`#16213E`): Slightly lighter dark surface for cards and content areas.
- **Hairline** (`#2A3A5C`): Subtle dividers on dark backgrounds.

### Category Colors
Each news category has a dedicated accent color:
- **Business** (`#FFB74D`): Warm amber-orange.
- **Entertainment** (`#E91E63`): Hot pink.
- **General** (`#607D8B`): Cool gray-blue.
- **Health** (`#4CAF50`): Green.
- **Science** (`#7C4DFF`): Deep purple.
- **Sports** (`#FF5722`): Deep orange.
- **Technology** (`#00BCD4`): Cyan.

### Text
- **Ink** (`#FFFFFF`): Primary text on all dark surfaces.
- **Body** (`#A0B3D0`): Secondary/long-form text.
- **Mute** (`#5C6B8A`): Low-priority text, captions, metadata.

## Typography

| Token | Size | Weight | Use |
|---|---|---|---|
| AppBar Title | 20px | 600 | AppBar and section headers |
| Body | 16px | 400 | Article text and body content |
| Caption | 12px | 400 | Metadata, timestamps, source labels |

## Do's and Don'ts

### Do
- Maintain the deep navy dark canvas — it's the core identity.
- Use the red accent `#E94560` for interactive highlights and active states.
- Use category-specific colors for visual identification.
- Keep text contrast high (white on dark) for readability.

### Don't
- Don't switch to a light theme — the dark mode is intentional.
- Don't use the red accent for non-interactive text.
- Don't flatten category icons into a list — the horizontal scroll is the navigation model.
- Don't add competing accent colors beyond the seven category colors.
