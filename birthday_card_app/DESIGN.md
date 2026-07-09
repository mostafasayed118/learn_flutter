---
version: alpha
name: Birthday-Card-Design
description: A soft, minimal digital greeting card — full-bleed birthday cake photography on a pastel lavender canvas with zero chrome and a calm, single-screen focus.

colors:
  primary: "#D3BCD6"
  on-primary: "#FFFFFF"
  canvas: "#D3BCD6"
  ink: "#4A3654"
  body: "#6B4F7A"
  mute: "#9B85A6"
  surface-ambient: "#D3BCD6"
  selection-bg: "#5E3A6B"
  selection-fg: "#F5EEF7"

typography:
  display-card:
    fontFamily: system-ui, -apple-platform, sans-serif
    fontSize: 0px
    fontWeight: 400
    lineHeight: 0px

rounded:
  none: 0px

spacing:
  none: 0px

components:
  page:
    backgroundColor: "{colors.primary}"
    bodyAlignment: center
  card-image:
    fit: cover
    alignment: center

---

## Overview

A single-screen digital birthday card with a full-body (`fit: cover`) Image widget on a pastel lavender `#D3BCD6` background. No AppBar, no buttons, no text — just a centered birthday cake photo. The entire design is one visual frame: a calm, pastel-wrapped greeting.

The page is a `Scaffold` with the `backgroundColor` set to `{colors.primary}` lavender. The image fills the safe area through `fit: BoxFit.cover`, meaning the cake is always full-viewport regardless of device aspect ratio. The card has zero interaction — it's a display-only greeting.

## Colors

### Surface
- **Lavender Ambient** (`{colors.primary}` — `#D3BCD6`): The single background color. A soft pastel purple-pink that wraps the entire screen.

### Semantic
- No buttons, no text, no links. The only visual element is the birthday cake image.
- In a hypothetical dark-mode variant, the background would invert to a deeper purple (`#9B85A0` mute) with the image retaining its full brightness.

## Typography
No text elements in the interface. The greeting is communicated entirely through the birthday cake imagery.

## Layout

### Single-Axis
- **Full-screen image** — `Scaffold` body contains only a centered `Image` widget.
- The image is pixel-resolution matched (`fit: cover`) to fill the viewport while maintaining aspect ratio.
- No layout constraints, no padding, no margins.

### Whitespace
The lavender background acts as the "matting" around the cake image — where the image doesn't fill the aspect ratio, the pastel frame serves as natural whitespace.

### Responsive
- The image scales with `fit: cover` so it always fills the viewport.
- On tall phones, the cake is centered vertically with the background color filling the remaining space.
- On wide tablets, the cake stays centered left-to-right.

## Shapes
- Zero border-radius on any surface. The card uses full-bleed geometry.
- The image has no container chrome — no shadow, no border, no corner radius.

## Do's and Don'ts

### Do
- Keep the background pastel lavender — it's the warm, non-competitive frame for the birthday cake.
- Use `fit: cover` to ensure the image fills the viewport on any screen ratio.
- Keep it single-screen and zero-navigation — the card is one gesture.

### Don't
- Don't add text overlays — let the cake image be the entire message.
- Don't add buttons or interactive elements — the card is a passive greeting.
- Don't add an AppBar — it breaks the full-bleed effect.
- Don't crop the image aggressively — `fit: cover` is the correct fill behavior.