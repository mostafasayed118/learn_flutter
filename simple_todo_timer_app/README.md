# Simple Todo & Timer App

![Flutter](https://img.shields.io/badge/Framework-Flutter-02569B)
![Dart](https://img.shields.io/badge/Language-Dart-0175C2)
![Status](https://img.shields.io/badge/Status-WIP-ff6b6b)

> A clean-architecture todo list + timer application — **work in progress**. Currently an early-stage scaffold with the folder structure laid out but no implementation yet.

> ⚠️ **Status: Early scaffold.** No `pubspec.yaml` or Dart source files exist in this directory yet. Feature set below is the target, not the current state.

## Target Features

- 📝 **Todo list** — add, edit, complete, and delete tasks with local persistence
- ⏱️ **Timer** — countdown timers for task focus sessions
- **Clean architecture** — `core` / `data` / `domain` / `features` / `shared` separation
- State management with `flutter_bloc`, DI with `get_it`, routing with `go_router`, local storage with `Hive`

## Planned Structure

```
lib/
├── core/                  # Entities, error handling
├── data/                  # Datasources, models, repositories
├── domain/                # Repository interfaces, usecases
├── features/todo/         # Todo feature (cubit, pages, widgets)
└── shared/                # DI, extensions, routing, theme
```

> Layout captured from the bootstrap plan in [`.kilo/plans/`](../.kilo/plans/) (todo + timer feature, Bloc, Hive, GoRouter).

## Getting Started

Not yet runnable — wait until the bootstrap is complete (planned: `flutter create` + clean-architecture setup).

## Note

This repository is part of the [Learn Flutter](../README.md) collection; check back after the next commit for implementation updates.