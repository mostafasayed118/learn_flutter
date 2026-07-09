---
version: alpha
name: First-Flutter-Project-Design
description: A minimal hello-world layout experiment — four coloured containers in a horizontal row on a white canvas, anchored by a red AppBar, demonstrating basic Row alignment and Material theming.

colors:
  primary: "#F44336"
  on-primary: "#FFFFFF"
  canvas: "#FFFFFF"
  ink: "#000000"
  body: "#616161"
  container-red: "#F44336"
  container-green: "#69F0AE"
  container-yellow: "#FFF59D"
  hairline: "#E0E0E0"
  selection-bg: "#F44336"
  selection-fg: "#FFFFFF"

typography:
  appbar-title:
    fontFamily: system-ui, -apple-system, sans-serif
    fontSize: 20px
    fontWeight: 500
    lineHeight: 28px
  container-text:
    fontFamily: system-ui, -apple-system, sans-serif
    fontSize: 14px
    fontWeight: 400
    lineHeight: 20px

rounded:
  none: 0px

spacing:
  none: 0px

components:
  appbar:
    backgroundColor: "{colors.primary}"
    titleColor: "{colors.on-primary}"
    titleAlignment: center
    titleTypography: "{typography.appbar-title}"
  container-block:
    width: 80px
    height: 100px
    color: varies  # each container uses block-{color}
    childAlignment: center
    childTypography: "{typography.container-text}"
  page:
    backgroundColor: "{colors.canvas}"

---

## Overview

A minimal Flutter exploration layout: four 80×100 px coloured containers (red, green, red, yellow) arranged in a horizontal `Row` with `spaceEvenly` distribution and `center` cross-alignment. A red `AppBar` with centered "Flutter Home Page" title sits at the top. Each container holds a centered "Hello, world!" label. The layout uses `mainAxisSize: min` — the row shrinks to the width of its children rather than filling the page.

This is an educational first project — the design intentionally demonstrates basic Flutter primitives (Container, Row, AppBar, Material theming) without advanced styling.

## Colors

### Brand & Accent
- **Red Accent** (`{colors.primary}` — `#F44336`): Used for the AppBar background and the outer two containers. Creates visual symmetry.

### Container Palette
- **Green** (`{colors.container-green}` — `#69F0AE`): Second container — accent-green.
- **Yellow** (`{colors.container-yellow}` — `#FF59D`): Fourth container — accent-yellow.

### Surface
- **Canvas** (`{colors.canvas}` — `#FFFFFF`): Scaffold background.

### Text
- **Ink** (`{colors.ink}` — `#000000`): Default text colour for container labels.

## Typography
System-native sans-serif stack. No custom fonts.

| Token | Size | Weight | Use |
|---|---|---|---|
| `{typography.appbar-title}` | 20px | 500 | AppBar title |
| `{typography.container-text}` | 14px | 400 | Inside containers |

## Layout

### Row Layout
- Four evenly-spaced containers (`mainAxisAlignment: spaceEvenly`), centre-vertically aligned (`crossAxisAlignment: center`).
- `mainAxisSize: min` — the row shrinks to fit its children rather than filling the width.
- Each container is 80 × 100 px.

### Whitespace
- The space between containers is determined by `spaceEvenly` — equal gaps on all sides.
- No padding or margin beyond the default Row spacing.

## Shapes
- **All containers**: zero border-radius (`{rounded.none}`) — hard-edge rectangles.
- **AppBar**: Flutter default `Material` AppBar with no elevation override.

## Do's and Don'ts

### Do
- Use red for the AppBar and the outer containers to create a bookend visual effect.
- Keep containers at equal width/height for a clean, gridded demo.

### Don't
- Don't add rounded corners — the educational demo uses hard-edged rectangles.
- Don't use text wrapping inside containers — the text stays on one line.
- Don't mix alignment strategies — the uniform `center` alignment is part of the learning structure.
