---
version: alpha
name: Weather-App-Design
description: A clean, minimalist weather application displaying current weather conditions for a selected city. The design features a prominent blue app bar, a centralized content area for city, time, temperature, and weather status, and uses a mix of bold and normal text styles.
colors:
  primary: "#2196F3"
  on-primary: "#FFFFFF"
  canvas: "#FFFFFF"
  ink: "#000000"
  body: "#000000"
  mute: "#9E9E9E"

typography:
  appbar-title:
    fontFamily: system-ui, -apple-system, sans-serif
    fontSize: 20px
    fontWeight: 700
    color: "{colors.on-primary}"
  city-name:
    fontFamily: system-ui, -apple-system, sans-serif
    fontSize: 24px
    fontWeight: 700
    color: "{colors.ink}"
  updated-time:
    fontFamily: system-ui, -apple-system, sans-serif
    fontSize: 20px
    fontWeight: 400
    color: "{colors.ink}"
  temperature:
    fontFamily: system-ui, -apple-system, sans-serif
    fontSize: 48px
    fontWeight: 400
    color: "{colors.ink}"
  weather-status:
    fontFamily: system-ui, -apple-system, sans-serif
    fontSize: 24px
    fontWeight: 400
    color: "{colors.ink}"
  no-weather-bold:
    fontFamily: system-ui, -apple-system, sans-serif
    fontSize: 20px
    fontWeight: 700
    color: "{colors.ink}"
  no-weather-grey:
    fontFamily: system-ui, -apple-system, sans-serif
    fontSize: 24px
    fontWeight: 400
    color: "{colors.mute}"

spacing:
  xs: 8px
  md: 16px
  lg: 24px
  xl: 40px

components:
  appbar:
    backgroundColor: "{colors.primary}"
    titleColor: "{colors.on-primary}"
    titleTypography: "{typography.appbar-title}"
    centerTitle: true
    elevation: 0
  page:
    backgroundColor: "{colors.canvas}"
  weather-display:
    cityTypography: "{typography.city-name}"
    updatedTypography: "{typography.updated-time}"
    tempTypography: "{typography.temperature}"
    statusTypography: "{typography.weather-status}"
  no-weather-message:
    welcomeTypography: "{typography.no-weather-bold}"
    instructionTypography: "{typography.no-weather-grey}"

---

## Overview

A simple weather application designed to display current weather information for a specified city. The app features a prominent blue AppBar with a white, bold title, and a centered main content area. This area presents the city name, the last updated time, the current temperature, and a brief weather status. The design adheres to a clean, minimalist aesthetic with clear typography and a white background, ensuring readability.

When no weather data is available, a "Welcome to the Weather App 🌤️" message is displayed, followed by instructions to start searching for weather information.

## Features

-   **Current Weather Display**: Shows city, last updated time, temperature, and weather condition.
-   **Minimalist UI**: Clean and straightforward interface focusing on essential weather information.
-   **Custom Text Widgets**: Reusable `TextWidgetBold`, `TextWidgetNormal`, and `TextWidgetGrey` for consistent typography.
-   **No Weather State**: Displays a friendly message and instructions when no weather data is loaded.

## Architecture

```
lib/
├── main.dart                    # App entry point, MaterialApp setup
├── views/
│   └── home_view.dart           # Main screen displaying weather information or no-weather message
└── widgets/
    ├── text_widget_bold.dart    # Reusable widget for bold text
    ├── text_widget_grey.dart    # Reusable widget for grey text
    ├── text_widget_normal.dart  # Reusable widget for normal text
    └── no_weather_body_widget.dart # Widget for displaying message when no weather data is available
```

## Dependencies

| Package         | Purpose                                |
| --------------- | -------------------------------------- |
| `flutter`       | Core Flutter framework and widgets     |
| `cupertino_icons` | iOS-style icons                        |

## Colors

### Primary & Accent
-   **Primary Blue** (`#2196F3`): Used for the AppBar background.
-   **On Primary White** (`#FFFFFF`): Used for AppBar title text.

### Surface
-   **Canvas White** (`#FFFFFF`): Main background color for the body.

### Text
-   **Ink Black** (`#000000`): Default text color for city, time, temperature, and weather status.
-   **Mute Grey** (`#9E9E9E`): Used for instructional text when no weather data is available.

## Typography

### Font Family
System-native sans-serif. No custom fonts.

### Hierarchy

| Token                 | Size | Weight | Color         | Use                                       |
| --------------------- | ---- | ------ | ------------- | ----------------------------------------- |
| AppBar Title          | 20px | 700    | White         | AppBar title                              |
| City Name             | 24px | 700    | Black         | Displayed city name                       |
| Updated Time          | 20px | 400    | Black         | Last updated timestamp                    |
| Temperature           | 48px | 400    | Black         | Current temperature                       |
| Weather Status        | 24px | 400    | Black         | Current weather condition (e.g., "Sunny") |
| No Weather Bold       | 20px | 700    | Black         | Welcome message                           |
| No Weather Grey       | 24px | 400    | Grey (`#9E9E9E`) | Instructions when no weather data         |

## Layout

### General
-   **AppBar**: Fixed at the top, `centerTitle: true`.
-   **Body**: Uses a `Center` widget to horizontally and vertically align a `Column` of content.
-   **Column**: `mainAxisSize: MainAxisSize.min` to wrap its children vertically.
-   **Row**: Used to display temperature and weather status side-by-side, `mainAxisAlignment: MainAxisAlignment.center`.

### Whitespace
-   `SizedBox(width: 8)`: Horizontal spacing between temperature and weather status.
-   `SizedBox(height: 40)`: Vertical spacing in the `NoWeatherBody` widget.

### Responsive
-   Layouts are designed to be responsive, primarily using `Center`, `Column`, and `Row` widgets that adapt to available screen space. Text sizes are defined in absolute `px` values but scale relatively well on different devices.

## Shapes
-   **AppBar**: Flat design with `elevation: 0`.
-   **Body**: Standard rectangular layout for content, no custom rounded corners on cards or elements (as of current implementation).

## Do's and Don'ts

### Do
-   Maintain the clean, minimalist aesthetic.
-   Use `Colors.blue` for interactive elements and key headers.
-   Ensure text is highly readable against its background.
-   Keep the main weather information centralized.

### Don't
-   Avoid introducing complex backgrounds or excessive animations.
-   Don't deviate from the established color palette and typography hierarchy.
-   Do not add unnecessary padding or margins that disrupt the minimalist layout.
-   Avoid adding complex UI elements that distract from the primary function of displaying weather.
