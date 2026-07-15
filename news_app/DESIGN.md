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

A dark-themed news reader app with real-time article fetching from NewsAPI. The homepage displays a horizontal scrollable category selector with 7 color-coded icon assets (`.jpeg` format) for Business, Entertainment, General, Health, Science, Sports, and Technology. Tapping a category loads category-specific articles. Tapping an article opens it in an in-app WebView for full reading. The design direction is a deep navy `#0F3460` canvas with a bright red `#E94560` accent — a high-contrast dark-mode news experience.

## Colors

### Brand & Accent
- **Deep Navy** (`{colors.primary}` — `#1A1A2E`): AppBar and dark surface.
- **Red Accent** (`{colors.accent}` — `#E94560`): Highlights, active states, and interactive accents. A bold, attention-grabbing red for a news app.

### Surface
- **Canvas** (`{colors.canvas}` — `#0F3460`): The primary page background — a rich dark blue.
- **Canvas Soft** (`{colors.canvas-soft}` — `#16213E`): A slightly lighter dark surface for cards and content areas.
- **Hairline** (`{colors.hairline}` — `#2A3A5C`): Subtle dividers on dark backgrounds.

### Category Colors
Each news category has a dedicated accent color for visual identification:
- **Business** (`#FFB74D`): Warm amber-orange.
- **Entertainment** (`#E91E63`): Hot pink.
- **General** (`#607D8B`): Cool gray-blue.
- **Health** (`#4CAF50`): Green.
- **Science** (`#7C4DFF`): Deep purple.
- **Sports** (`#FF5722`): Deep orange.
- **Technology** (`#00BCD4`): Cyan.

### Text
- **Ink** (`{colors.ink}` — `#FFFFFF`): Primary text on all dark surfaces.
- **Body** (`{colors.body}` — `#A0B3D0`): Secondary/long-form text.
- **Mute** (`{colors.mute}` — `#5C6B8A`): Low-priority text, captions, metadata.

## Typography

### Font Family
System-native sans-serif. No custom fonts.

### Hierarchy

| Token | Size | Weight | Use |
|---|---|---|---|
| `{typography.appbar-title}` | 20px | 600 | AppBar and section headers |
| `{typography.body}` | 16px | 400 | Article text and body content |
| `{typography.caption}` | 12px | 400 | Metadata, timestamps, source labels |

## Layout (Planned)

### Category Grid
- A horizontal scrollable list of category cards, each with a 48px icon centered on a dark card.
- Each card taps to load category-specific articles in the news list below.

### Article List
- `ListView.builder` of article cards — each card a `Container` with category-colored top border, headline text, source, and timestamp.

### Whitespace
- `16px` padding inside cards.
- `8px` gap between grid cards.
- `12px` internal spacing in article cards.

## Shapes
- **Category cards**: `{rounded.md}` (8px) corners.
- **Article cards**: `{rounded.md}` (8px) with a colored top border.
- **Icon assets**: `.jpeg` format — category-specific images.

## Do's and Don'ts

### Do
- Maintain the deep navy dark canvas — it's the core identity.
- Use the red accent `#E94560` for interactive highlights and active states.
- Use the category-specific colors for visual identification — each category should be instantly recognizable.
- Keep text contrast high (white on dark) for readability.

### Don't
- Don't switch to a light theme — the dark mode is intentional and part of the brand.
- Don't use the red accent for non-interactive text — it signals "tap/click" not "read."
- Don't flatten category icons into a list — the horizontal scroll is the navigation model.
- Don't add competing accent colors beyond the seven category colors.