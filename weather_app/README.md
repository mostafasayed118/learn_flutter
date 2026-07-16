---
version: alpha
name: Weather-App
description: A clean, minimalist Flutter application to display current weather conditions. Features a blue app bar, a centralized display for city, time, temperature, and weather status, and uses custom text widgets for consistent typography.

---

# Weather App

A simple and elegant Flutter weather application that fetches and displays real-time weather conditions for a selected city. The app is designed with a minimalist user interface, focusing on readability and essential information.

## Features

-   **Current Weather Display**: Shows the city name, last updated time, current temperature, and a brief weather status (e.g., "Sunny").
-   **Minimalist User Interface**: Clean and straightforward design with a prominent blue app bar and a centralized content area.
-   **Custom Text Widgets**: Utilizes reusable `TextWidgetBold`, `TextWidgetNormal`, and `TextWidgetGrey` for consistent styling across the application.
-   **No Weather State**: Provides a welcoming message and instructions when no weather data has been loaded or selected, guiding the user to search for a city.

## UI/UX Design

The application follows a clean, minimalist design with a clear hierarchy of information.

### Colors

-   **Primary Blue** (`#2196F3`): AppBar background.
-   **White** (`#FFFFFF`): AppBar text, main canvas background.
-   **Black** (`#000000`): Main text color for city, temperature, and status.
-   **Grey** (`#9E9E9E`): Muted text for instructions or secondary information.

### Typography

-   **AppBar Title**: System-native sans-serif, 20px, bold (700 weight), white.
-   **City Name**: System-native sans-serif, 24px, bold (700 weight), black.
-   **Updated Time**: System-native sans-serif, 20px, normal (400 weight), black.
-   **Temperature**: System-native sans-serif, 48px, normal (400 weight), black.
-   **Weather Status**: System-native sans-serif, 24px, normal (400 weight), black.

### Layout

-   **AppBar**: Centered title.
-   **Body**: Content is centrally aligned using a `Center` widget containing a `Column`.
-   **Main Content**: A `Column` arranges weather details vertically. A `Row` groups temperature and status horizontally.
-   **Spacing**: Minimal spacing is used to maintain a clean look. `SizedBox` widgets control spacing between elements.

For a detailed breakdown of the design system, refer to [DESIGN.md](./DESIGN.md).

## Architecture

The project follows a component-based architecture for better organization and reusability:

```
lib/
├── main.dart                    # Application entry point and root widget
├── views/
│   └── home_view.dart           # Main screen, displays weather or no-weather message
└── widgets/
    ├── text_widget_bold.dart    # Custom widget for bold text styling
    ├── text_widget_grey.dart    # Custom widget for grey text styling
    ├── text_widget_normal.dart  # Custom widget for normal text styling
    └── no_weather_body_widget.dart # Widget to show when no weather data is available
```

## Getting Started

To run this project:

```bash
# Navigate to the project directory
cd weather_app

# Get dependencies
flutter pub get

# Run the app
flutter run
```
