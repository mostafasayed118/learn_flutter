# First Project

![Flutter](https://img.shields.io/badge/Framework-Flutter-02569B)
![Dart](https://img.shields.io/badge/Language-Dart-0175C2)

> My very first Flutter "Hello World" — a simple layout exercise with a red AppBar and four colored containers arranged in a Row.

## Overview

A minimal Flutter application built as the first hands-on project. It demonstrates the basics of `MaterialApp`, `Scaffold`, `AppBar`, and `Row` layout with four colored containers, each labeled "Hello, world!".

## Features

- Red AppBar titled **Flutter Home Page**
- Four colored containers (red/green/yellow) in a single `Row`
- Each container displays the classic "Hello, world!" text

## Getting Started

```bash
cd first_project
flutter pub get
flutter run
```

## Project Structure

```
lib/
└── main.dart          # App entry point — MaterialApp + Scaffold + Row layout
```

## Design

See [DESIGN.md](./DESIGN.md) for the full design system (colors, typography, layout).

## Dependencies

| Package | Purpose |
|---|---|
| `flutter` | Core framework |
| `cupertino_icons` | iOS-style icons |