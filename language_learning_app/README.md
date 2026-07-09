---
version: alpha
name: Language-Learning-App-Design
description: A warm, earthy educational app for learning Japanese vocabulary — brown-brown AppBar, cream canvas, and four saturated category bands (orange, green, purple, teal) each containing a scrollable list of vocabulary items with images, translations, and audio playback.

colors:
  primary: "#46322B"
  on-primary: "#FFFFFF"
  canvas: "#FEF6DB"
  ink: "#1A1A1A"
  body: "#3E2723"
  mute: "#8D6E63"
  category-numbers: "#EF9235"
  category-family: "#558B37"
  category-colors: "#79359F"
  category-phrases: "#50ADC7"
  phrase-item-bg: "#7C3F58"
  image-bg: "#FEF6DB"
  play-icon-color: "#FFFFFF"
  appbar-bg: "#46322B"
  appbar-text: "#FFFFFF"
  selection-bg: "#46322B"
  selection-fg: "#FEF6DB"

typography:
  appbar-title:
    fontFamily: system-ui, -apple-system, sans-serif
    fontSize: 20px
    fontWeight: 700
    lineHeight: 28px
  category-label:
    fontFamily: system-ui, -apple-system, sans-serif
    fontSize: 18px
    fontWeight: 400
    lineHeight: 24px
  item-label:
    fontFamily: system-ui, -apple-system, sans-serif
    fontSize: 18px
    fontWeight: 400
    lineHeight: 24px
  item-translation:
    fontFamily: system-ui, -apple-system, sans-serif
    fontSize: 18px
    fontWeight: 400
    lineHeight: 24px

rounded:
  none: 0px
  sm: 4px

spacing:
  xs: 8px
  sm: 12px
  md: 16px
  lg: 24px

components:
  appbar:
    backgroundColor: "{colors.appbar-bg}"
    titleColor: "{colors.appbar-text}"
    titleTypography: "{typography.appbar-title}"
  category-band:
    height: 60px
    width: full
    padding: "{spacing.md} 0px"
    alignment: centerLeft
    labelColor: "{colors.appbar-text}"
    labelTypography: "{typography.category-label}"
  item-row:
    height: 80px
    imageWidth: 80px
    labelColor: "{colors.appbar-text}"
    labelTypography: "{typography.item-label}"
    translationColor: "{colors.appbar-text}"
    translationTypography: "{typography.item-translation}"
    iconSize: 36px
  phrase-item:
    height: 100px
    labelColor: "{colors.appbar-text}"
    labelTypography: "{typography.item-label}"
    translationColor: "{colors.appbar-text}"
    translationTypography: "{typography.item-translation}"
  page:
    backgroundColor: "{colors.canvas}"

---
## Overview

A warm, earthy Japanese-English vocabulary learning app. The homepage is a vertical stack of four 60 px-tall category bands — Numbers (orange), Family Members (green), Colors (purple), and Phrases (teal) — each spanning the full width on a cream `#FEF6DB` canvas. Tapping a category pushes a new screen with a scrollable `ListView` of vocabulary items. Each item row contains an image thumbnail (for non-phrase categories), an English label, a Japanese translation, and a circular play button that triggers native audio pronunciation via the `audioplayers` package.

The brown AppBar (`#46322B`) is used across all screens for visual consistency. Phrases use a slightly different item component (`PhraseItem`) with a pink-brown `#7C3F58` background since they have no associated image.

## Colors

### Brand & Accent
- **Brown** (`{colors.primary}` / `{colors.appbar-bg}` — `#46322B`): The dark brown used for every AppBar. Gives the app an earthy, grounded feel appropriate for language learning.
- **Cream** (`{colors.canvas}` — `#FEF6DB`): A warm off-white page background that sits behind the category bands.

### Category Bands
- **Numbers Orange** (`{colors.category-numbers}` — `#EF9235`): Vibrant, energetic, associated with counting.
- **Family Green** (`{colors.category-family}` — `#558B37`): Natural, warm, associated with people/growth.
- **Colors Purple** (`{colors.category-colors}` — `#79359F`): Creative, distinctive, associated with visual identity.
- **Phrases Teal** (`{colors.category-phrases}` — `#50ADC7`): Calm, communicative, associated with speech.

### Item-level
- **Phrase Item** (`{colors.phrase-item-bg}` — `#7C3F58`): A warm pink-brown for phrase items that lack an image thumbnail.
- **Image Thumbnail** (`{colors.image-bg}` — `#FEF6DB`): Cream background behind the image asset to match the page canvas.

### Text
- **On AppBar/Appbar Text** (`{colors.appbar-text}` — `#FFFFFF`): White text on all dark surfaces (AppBar, category labels, item labels).
- **On Cream** (`{colors.ink}` — `#1A1A1A`): Available for any text directly on the cream background (not currently used in the app).

## Typography

### Font Family
System-native sans-serif. No custom fonts loaded.

### Hierarchy

| Token | Size | Weight | Use |
|---|---|---|---|
| `{typography.appbar-title}` | 20px | 700 | AppBar titles (all screens) |
| `{typography.category-label}` | 18px | 400 | Category band text |
| `{typography.item-label}` | 18px | 400 | English vocabulary word |
| `{typography.item-translation}` | 18px | 400 | Japanese translation below the label |

### Principles
- Bold 700 only on the AppBar title — category bands and item rows use regular weight.
- Consistent 18px across all list items — the size is readable for both English and Japanese characters.
- White text is used on every dark surface (AppBar, category bands, item rows) — no dark text on dark backgrounds.

## Layout

### Homepage
- **Column** of four `Category` widgets (60 px each, full width), vertically stacked with no gaps.
- Each category is a `GestureDetector` wrapping a `Container` with left-aligned text.
- Background: `#FEF6DB` cream.

### Category Screens (Numbers, Family, Colors, Phrases)
- **AppBar** with a back arrow and category title.
- **ListView.builder** filling the body — each item is 80–100 px tall.
- Items use a `Row`: image thumbnail (80 px wide on cream background) → text column (label + translation) → `Spacer` → play button icon.

### Whitespace
- `16px` horizontal padding inside category bands.
- `16px` gap between the image and text in item rows.
- `16px` right margin for the play icon.

### Responsive
- No max-width constraints — the full-width category bands and scrollable lists scale to any device.
- Item heights remain fixed (80 px) — images and text scale proportionally.

## Shapes
- **Category bands**: zero border-radius — full-width rectangular strips.
- **Item rows**: zero border-radius — full-width strips.
- **Play icon**: rendered via `Icons.play_arrow` — circular implicit hit target.

## Do's and Don'ts

### Do
- Maintain the cream `#FEF6DB` canvas — it's the warm educational identity.
- Keep the dark brown AppBar consistent across all category screens.
- Each category band must use its assigned color — the color-coding is the primary navigation cue.
- Play audio via the `play_arrow` icon — it's the universal signal for "listen."

### Don't
- Don't change the category band colors — the color-to-category association is the navigation model.
- Don't use a white background — the cream canvas is part of the brand.
- Don't make item rows taller than 100 px — the density is appropriate for vocabulary review.
- Don't add complex animations — the audio feedback is the interaction payoff.
