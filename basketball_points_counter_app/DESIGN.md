---
version: alpha
name: Basketball-Points-Counter-Design
description: A real-time sports scoreboard design — energetic orange palette, split-screen two-team layout, large score typography, and tactile button controls for basketball game tracking.

colors:
  primary: "#FF9800"
  on-primary: "#FFFFFF"
  canvas: "#FFFFFF"
  canvas-soft: "#FFF3E0"
  ink: "#212121"
  body: "#616161"
  mute: "#9E9E9E"
  divider: "#FF9800"
  team-a-accent: "#FF9800"
  team-b-accent: "#FF9800"
  reset-danger: "#F44336"
  reset-text: "#FFFFFF"
  hairline: "#E0E0E0"
  selection-bg: "#FF9800"
  selection-fg: "#FFFFFF"

typography:
  display-score:
    fontFamily: system-ui, -apple-system, sans-serif
    fontSize: 48px
    fontWeight: 700
    lineHeight: 56px
  display-team:
    fontFamily: system-ui, -apple-system, sans-serif
    fontSize: 24px
    fontWeight: 700
    lineHeight: 32px
  body-btn:
    fontFamily: system-ui, -apple-system, sans-serif
    fontSize: 16px
    fontWeight: 600
    lineHeight: 24px
  body-reset:
    fontFamily: system-ui, -apple-system, sans-serif
    fontSize: 16px
    fontWeight: 600
    lineHeight: 24px
  appbar-title:
    fontFamily: system-ui, -apple-system, sans-serif
    fontSize: 20px
    fontWeight: 500
    lineHeight: 28px

rounded:
  none: 0px
  sm: 4px
  md: 8px

spacing:
  xs: 8px
  sm: 16px
  md: 24px
  lg: 32px
  xl: 64px

components:
  appbar:
    backgroundColor: "{colors.primary}"
    titleColor: "{colors.on-primary}"
    titleTypography: "{typography.appbar-title}"
  score-display:
    color: "{colors.ink}"
    typography: "{typography.display-score}"
  team-label:
    color: "{colors.ink}"
    typography: "{typography.display-team}"
  point-button:
    backgroundColor: "{colors.primary}"
    textColor: "{colors.on-primary}"
    typography: "{typography.body-btn}"
    shape: "{rounded.md}"
    margin: "{spacing.xs} 0px"
  reset-button:
    backgroundColor: "{colors.reset-danger}"
    textColor: "{colors.reset-text}"
    typography: "{typography.body-reset}"
    shape: "{rounded.md}"
  divider-vertical:
    color: "{colors.divider}"
    thickness: 2px
  page:
    backgroundColor: "{colors.canvas}"

---
## Overview

An orange-accented sports scoreboard designed for quick, unambiguous score tracking during a basketball game. The UI splits into two mirrored columns — Team A (left) and Team B (right) — separated by a vertical orange divider. Each column stacks three point-increment buttons (1 pt, 2 pt, 3 pt) below a large score display. A red Reset button at the bottom clears both scores. The design prioritises large tap targets, high-contrast score readouts, and energetic orange branding typical of sports interfaces.

## Colors

### Brand & Accent
- **Primary Orange** (`{colors.primary}` — `#FF9800`): The energetic sports-brand orange used for the AppBar, all point buttons, and the vertical divider. Carries every scoring action.
- **Danger Red** (`{colors.reset-danger}` — `#F44336`): The Reset button — deliberately distinct from orange to prevent accidental score wipe.

### Surface
- **Canvas** (`{colors.canvas}` — `#FFFFFF`): Pure white page background behind the scoreboard.
- **Canvas Soft** (`{colors.canvas-soft}` — `#FFF3E0`): A soft orange-tinted surface (not used in the base app but available for hover/highlight states).

### Text
- **Ink** (`{colors.ink}` — `#212121`): Team names and score numbers.
- **Body** (`{colors.body}` — `#616161`): Secondary labels.
- **On Primary** (`{colors.on-primary}` — `#FFFFFF`): All text on orange buttons and the AppBar.

## Typography

### Font Family
System-native sans-serif stack (`system-ui, -apple-system, sans-serif`) — no custom fonts loaded.

### Hierarchy

| Token | Size | Weight | Use |
|---|---|---|---|
| `{typography.display-score}` | 48px | 700 | The live team score. |
| `{typography.display-team}` | 24px | 700 | Team name labels. |
| `{typography.body-btn}` | 16px | 600 | Point-increment button labels. |
| `{typography.body-reset}` | 16px | 600 | Reset button label. |
| `{typography.appbar-title}` | 20px | 500 | AppBar title. |

### Principles
- Bold weight 700 for score readability from a distance.
- Consistent 600 for all button labels — no ambiguity about tap intent.
- All text is solid-dark on light backgrounds for high contrast.

## Layout

### Structure
- **Page**: full-screen `Column` centred vertically (`mainAxisAlignment: center`).
- **Scoreboard row**: an `IntrinsicHeight` wrapping a two-column `Row` divided by a `VerticalDivider`.
- **Each team column**: a `Column` with Team label → Score → 1pt button → 2pt button → 3pt button.

### Whitespace
- `SizedBox(height: 16)` between team label and score.
- `SizedBox(height: 8)` between each point button.
- `SizedBox(height: 64)` between the scoreboard row and the Reset button.
- Team columns use `spaceEvenly` main axis alignment inside the row.

### Responsive Strategy
- The mirrored column layout scales to fill the screen width (no max-width constraint set).
- On very narrow screens (<360 px), button labels remain readable at 16 px.
- The `IntrinsicHeight` wrapper ensures both team columns stretch to equal height.

## Shapes
- **Point buttons**: `{rounded.md}` 8px — soft rounded rectangle.
- **Reset button**: `{rounded.md}` 8px — same corner radius for consistency.
- **Divider**: 2px solid orange `VerticalDivider` at 64 px width.
- All buttons use Material `ElevatedButton` styling with no special elevation treatment.

## Do's and Don'ts

### Do
- Use `{colors.primary}` orange for every scoring action button — consistent sports-energy signal.
- Keep the two-team column layout perfectly mirrored for fair visual weight.
- Stack points from 1 → 2 → 3 in ascending order.
- Reserve red exclusively for the Reset button to prevent accidental presses.

### Don't
- Don't introduce a third team column — the two-team split is the core layout.
- Don't change the divider color from orange — it anchors the visual split.
- Don't use icons on the score buttons — text labels ("Add 1 Point") are clearer.
- Don't add auto-scoring or countdown timers — the app is a manual scoreboard.