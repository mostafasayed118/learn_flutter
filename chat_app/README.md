---
version: alpha
name: Chat-App-Design
description: A minimal chat app scaffold — a single-screen starter project with a centered "Home" text on a white canvas, providing a foundation for building chat functionality.

colors:
  primary: "#2196F3"
  on-primary: "#FFFFFF"
  canvas: "#FFFFFF"
  ink: "#000000"
  selection-bg: "#2196F3"
  selection-fg: "#FFFFFF"

typography:
  home-text:
    fontFamily: system-ui, -apple-system, sans-serif
    fontSize: 24px
    fontWeight: 400
    lineHeight: 32px

rounded:
  none: 0px

spacing:
  none: 0px

components:
  page:
    backgroundColor: "{colors.canvas}"
    bodyAlignment: center

---

## Overview

A minimal Flutter starter project — a single-screen scaffold with a centered "Home" text label. This app serves as a foundational template for building chat functionality. The current implementation is a bare `Scaffold` with `main.dart` entry point and a `HomeView` widget that displays a centered text element on a white background.

The project uses Flutter's default `MaterialApp` with no custom theming, no AppBar, and no navigation. It's designed as a clean starting point for adding chat features incrementally.

## Architecture

```
lib/
├── main.dart          # App entry point, MaterialApp setup
└── views/
    └── home_view.dart # Single-screen home view with centered text
```

## Dependencies

| Package | Purpose |
|---|---|
| `flutter` | Core Flutter framework and widgets |
| `cupertino_icons` | iOS-style icons |

## Colors

### Surface
- **Canvas** (`{colors.canvas}` — `#FFFFFF`): Pure white page background.

### Text
- **Ink** (`{colors.ink}` — `#000000`): Default text color for the centered "Home" label.

## Typography

### Font Family
System-native sans-serif. No custom fonts.

### Hierarchy

| Token | Size | Weight | Use |
|---|---|---|---|
| `{typography.home-text}` | 24px | 400 | Centered "Home" text |

## Layout

### Structure
- **Page**: Full-screen `Scaffold` with a `Center` widget containing a single `Text` child.
- No AppBar, no padding, no navigation — just the centered label.

### Responsive
- The centered text scales with the screen size.
- No constraints, no scrolling — the layout adapts to any viewport.

## Shapes
- Zero border-radius on any element — the design is entirely rectangular.

## Do's and Don'ts

### Do
- Use this as a starting point for building chat features.
- Keep the centered layout as a loading/placeholder state.
- Add navigation and additional screens as the app grows.

### Don't
- Don't add complex layouts without first establishing the chat architecture.
- Don't add custom theming until the feature set is defined.
- Don't add third-party packages until they're needed.
