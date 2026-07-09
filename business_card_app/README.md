---
version: alpha
name: Business-Card-Design
description: A digital personal business card — blue-branded single-screen profile with a circular avatar, hand-lettered cursive name via the Pacifico font, and white contact cards for phone, email, and website.

colors:
  primary: "#79A3EB"
  on-primary: "#FFFFFF"
  canvas: "#79A3EB"
  canvas-soft: "#A7C4F2"
  ink: "#FFFFFF"
  body: "#FFFFFF"
  body-muted: "#FFFFFF80"
  card-bg: "#FFFFFF"
  card-icon: "#79A3EB"
  card-text: "#79A3EB"
  hairline: "#FFFFFF"
  divider: "#FFFFFF"
  divider-opacity: 0.5
  selection-bg: "#79A3EB"
  selection-fg: "#FFFFFF"

typography:
  display-name-cursive:
    fontFamily: Pacifico, cursive
    fontSize: 32px
    fontWeight: 400
    lineHeight: 40px
  display-title:
    fontFamily: system-ui, -apple-system, sans-serif
    fontSize: 24px
    fontWeight: 700
    lineHeight: 32px
  body-contact:
    fontFamily: system-ui, -apple-system, sans-serif
    fontSize: 18px
    fontWeight: 400
    lineHeight: 24px
  body-email:
    fontFamily: system-ui, -apple-system, sans-serif
    fontSize: 18px
    fontWeight: 400
    lineHeight: 24px
  body-website:
    fontFamily: system-ui, -apple-system, sans-serif
    fontSize: 18px
    fontWeight: 400
    lineHeight: 24px

rounded:
  sm: 8px
  full: 9999px

spacing:
  xs: 8px
  sm: 16px
  md: 24px

components:
  page:
    backgroundColor: "{colors.primary}"
    bodyAlignment: center
  profile-avatar:
    shape: full
    size: 200px
    borderWidth: 0px
  name-text:
    fontFamily: Pacifico
    color: "{colors.ink}"
    typography: "{typography.display-name-cursive}"
  title-text:
    color: "{colors.body-muted}"
    typography: "{typography.display-title}"
  divider:
    color: "{colors.divider}"
    opacity: "{colors.divider-opacity}"
    thickness: 2px
    margin: "{spacing.sm} {spacing.lg}"
  contact-card:
    backgroundColor: "{colors.card-bg}"
    textColor: "{colors.card-text}"
    iconColor: "{colors.card-text}"
    typography: "{typography.body-contact}"
    shape: "{rounded.sm}"
    margin: "{spacing.xs} {spacing.sm}"

---

## Overview

A single-screen digital business card with a blue-gray (`#79A3EB`) background and a central column of profile photo → name → title → contact information. The name "Mustafa Sayed" is rendered in the **Pacifico** hand-lettering cursive font for a personal, designer feel. The contact rows (phone, email, website) sit inside white rounded containers with matching blue icons and text. The layout is stacked vertically, centred, with a semi-transparent white divider separating the top branding from the contact area.

## Colors

### Brand & Accent
- **Blue Gray** (`{colors.primary}` — `#79A3EB`): The full-screen background. A soft blue-gray that serves as the brand color.
- **Card Text** (`{colors.card-text}` — `#79A3EB`): Icons and text inside the white contact cards — matching the background for a monochromatic brand feel.

### Surface
- **Card Background** (`{colors.card-bg}` — `#FFFFFF`): Pure white rectangles behind each contact row.
- **Page Background** (`{colors.primary}` — `#79A3EB`): The full-page canvas.

### Text
- **Ink** (`{colors.ink}` — `#FFFFFF`): The name — white for maximum contrast on the blue background.
- **Body Muted** (`{colors.body-muted}` — white at 50% opacity): The job title subtitle.

## Typography

### Font Family
Two faces:
1. **Pacifico** — a Google Fonts cursive hand-lettering face used exclusively for the name. Weight 400 only. Gives the card a personal, calligraphic feel.
2. **System UI stack** (`system-ui, -apple-system, sans-serif`) — for the job title and all contact text.

### Hierarchy

| Token | Size | Weight | Face | Use |
|---|---|---|---|---|
| `{typography.display-name-cursive}` | 32px | 400 | Pacifico | Personal name heading |
| `{typography.display-title}` | 24px | 700 | System | Job title ("Flutter Developer") |
| `{typography.body-contact}` | 20px | 400 | system | Phone number |
| `{typography.body-email}` | 18px | 400 | system | Email address |
| `{typography.body-website}` | 18px | 400 | system | Website URL |

## Layout

### Stack
- **Main column**: `Column` with `mainAxisAlignment: center`, vertical centre of the screen.
  1. `CircleAvatar` containing a `ClipOval` photo (200 × 200).
  2. `SizedBox(height: 16)` gap.
  3. Name text (32 px white Pacifico).
  4. Job title (24 px semi-transparent white).
  5. Semi-transparent white `Divider` (2 px, horizontal margins 32 px).
  6. Three white `Container` widgets (phone, email, website) — each 50 px tall, `margin: 8px 16px`, with leading icons and text.

### Whitespace
- `16px` between avatar and name.
- `8px` between name and job title.
- `8px` between the divider and the first contact card.
- `8px` vertical margin between contact cards.

## Shapes
- **Profile photo**: `CircleAvatar` (full round).
- **Contact cards**: `{rounded.sm}` (8px) rounded rectangle.
- **Divider**: full-width line with `indent: 32` and `endIndent: 32`.

## Do's and Don'ts

### Do
- Use the Pacifico font for the name only — the cursive face gives personal branding without sacrificing readability of contact details.
- Keep contact cards pure white — the contrast with the blue background makes them the primary interaction targets.
- Use the brand blue `#79A3EB` for all icons and text inside contact cards — a monochromatic brand accent.
- Centre the entire layout vertically — the card should feel balanced like a physical business card.

### Don't
- Don't use Pacifico for anything other than the name — overuse dilutes its personal-brand impact.
- Don't make the contact cards wider than the avatar — the 16 px horizontal margin on cards creates visual alignment.
- Don't use a background image — the solid blue canvas is the brand.
- Don't add an AppBar — the card is a single-screen display.
