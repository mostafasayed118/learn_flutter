---
version: alpha
name: Tones-Layer-App-Design
description: A rainbow xylophone pad — seven full-width horizontal color bands (blue, red, green, orange, purple, cyan, amber) that play .wav tones on tap, displayed in a vertical Column on a dark gray AppBar over an amber background.

colors:
  primary: "#FFC107"
  on-primary: "#FFFFFF"
  canvas: "#FFC107"
  ink: "#FFFFFF"
  body: "#212121"
  note-blue: "#2196F3"
  note-red: "#F44336"
  note-green: "#4CAF50"
  note-orange: "#FF9800"
  note-purple: "#9C27B0"
  note-cyan: "#00BCD4"
  note-amber: "#FFC107"
  appbar-bg: "#212121"
  appbar-text: "#FFFFFF"
  selection-bg: "#FFC107"
  selection-fg: "#000000"

typography:
  appbar-title:
    fontFamily: system-ui, -apple-system, sans-serif
    fontSize: 20px
    fontWeight: 500
    lineHeight: 28px
  note-label:
    fontFamily: system-ui, -apple-system, sans-serif
    fontSize: 16px
    fontWeight: 500
    lineHeight: 24px

rounded:
  none: 0px

spacing:
  none: 0px

components:
  appbar:
    backgroundColor: "{colors.appbar-bg}"
    titleColor: "{colors.appbar-text}"
    titleTypography: "{typography.appbar-title}"
    centerTitle: true
    elevation: 0
  note-pad:
    backgroundColor: varies  # each pad uses note-{color}
    height: fills available space (Expanded)
    textColor: "{colors.ink}"
    labelTypography: "{typography.note-label}"
    labelAlignment: center
  page:
    backgroundColor: "{colors.canvas}"

---

## Overview

A minimalist musical instrument — seven full-width horizontal color pads filling the screen from top to bottom. Each pad is a distinct color (blue, red, green, orange, purple, cyan, amber) and plays a unique `.wav` audio file on tap. The layout is a single `Column` of `Expanded` children — no scrolling, no padding, just the rainbow.

The dark gray AppBar (`#212121`) with centered "Flutter Tunes Layer App" title sits at the top. The remaining screen real estate is divided equally among the seven note pads. The amber page background (`#FFC107`) matches the last note color, creating a cohesive frame.

## Colors

### Note Palette
Seven distinct colors, one per musical note:

| Note | Color | Hex | Purpose |
|---|---|---|---|
| Note 1 | Blue | `#2196F3` | Cool starting tone |
| Note 2 | Red | `#F44336` | Energetic second tone |
| Note 3 | Green | `#4CAF50` | Natural third tone |
| Note 4 | Orange | `#FF9800` | Warm fourth tone |
| Note 5 | Purple | `#9C27B0` | Creative fifth tone |
| Note 6 | Cyan | `#00BCD4` | Bright sixth tone |
| Note 7 | Amber | `#FFC107` | Warm closing tone |

### Surface
- **Canvas** (`{colors.canvas}` — `#FFC107`): Amber page background visible around edges.
- **AppBar** (`{colors.appbar-bg}` — `#212121`): Near-black AppBar — high contrast against the rainbow body.

### Text
- **Ink** (`{colors.ink}` — `#FFFFFF`): White text on every note pad — high contrast against all seven colors.

## Typography

### Font Family
System-native sans-serif. No custom fonts.

### Hierarchy

| Token | Size | Weight | Use |
|---|---|---|---|
| `{typography.appbar-title}` | 20px | 500 | AppBar title |
| `{typography.note-label}` | 16px | 500 | "Note 1" through "Note 7" labels on each pad |

### Principles
- White text on every color — universal high contrast.
- Bold weight 500 for note labels — light enough for legibility, heavy enough for touch targets.
- The note labels are centered both vertically and horizontally within each pad.

## Layout

### Column of Expanded Children
- The body is a `Column` with seven `Expanded` children (one per note).
- Each `Expanded` wraps a `GestureDetector` → `Container` → centered `Text`.
- No spacing, no padding, no gaps — the pads fill the entire screen edge-to-edge.

### Whitespace
- Zero — the pads are flush against each other and the screen edges.
- The only "whitespace" is the AppBar at the top.

### Responsive
- Each pad takes 1/7 of the available height (minus the AppBar).
- On tall phones, pads are taller and more comfortable to tap.
- On short phones, pads remain tappable (minimum ~60 px on a 4-inch screen).
- No horizontal constraints — pads span full width.

## Shapes
- **Note pads**: zero border-radius (`{rounded.none}`) — full-width rectangles.
- **AppBar**: zero elevation, no shadow — flat dark bar.

## Do's and Don'ts

### Do
- Keep the seven-note rainbow sequence — it's the visual and musical identity.
- Use `Expanded` for equal vertical distribution — no fixed heights.
- Keep note labels centered and white — readability is the priority.
- Use the near-black AppBar as a neutral anchor above the rainbow.

### Don't
- Don't change the note colors — each color is tied to a specific `.wav` file.
- Don't add padding between pads — the flush rainbow is the design.
- Don't add icons or images to the pads — the color IS the interface.
- Don't make the app scrollable — all seven notes should be visible at once.