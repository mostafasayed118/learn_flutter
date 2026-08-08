# Simple Todo & Timer App

![Flutter](https://img.shields.io/badge/Framework-Flutter-02569B)
![Dart](https://img.shields.io/badge/Language-Dart-0175C2)
![Architecture](https://img.shields.io/badge/Architecture-Clean-green)
![Tests](https://img.shields.io/badge/Tests-26%20%E2%9C%94-blue)

> A clean-architecture **todo list + focus timer** built with Flutter, Bloc, and Hive. Track tasks, check them off, and run 25-minute focus sessions with elapsed time persisted per todo.

## Features

- ✅ **Todo management** — add, toggle-complete, and delete todos (with confirmation dialog)
- ⏱️ **Focus timer** — 25-minute session per todo with play/pause/reset
- 🕒 **Focus tracking** — total focused time (min/sec) accumulated per todo
- 💾 **Local persistence** — todos survive restarts via Hive
- 🧩 **Clean architecture** — separated core / data / domain / presentation layers

## Architecture

```
lib/
├── main.dart                       # Bootstrap: Hive init + GetIt wiring + runApp
├── core/                           # Pure domain layer (no Flutter imports)
│   ├── entities/todo.dart          # Todo entity
│   └── error/                      # AppError (sealed) + Result<T> (Ok/Err)
├── data/                           # Storage implementation
│   ├── database/                   # HiveService (init/box) + TodoDao
│   ├── models/todo_adapter.dart    # Hand-written Hive TypeAdapter
│   └── repositories/               # TodoRepositoryImpl → Result<T>
├── domain/
│   ├── repositories/               # TodoRepository interface
│   └── usecases/                   # GetTodos, AddTodo, DeleteTodo, ToggleTodo, UpdateTimerSession
├── features/todo/presentation/
│   ├── cubits/                     # TodoCubit + TimerCubit (Bloc)
│   ├── pages/                      # TodoListPage, FocusTimerPage
│   └── widgets/                    # TodoItem, TimerDisplay, EmptyState, error view
└── shared/
    ├── di/injection.dart           # GetIt service locator
    ├── routing/app_router.dart     # GoRouter: "/" and "/timer/:id"
    ├── extensions/formatters.dart  # MM:SS formatting
    └── theme/app_theme.dart        # Material 3 theme
```

### Data flow

**Todo CRUD:** UI → TodoCubit → usecase → TodoRepository → TodoRepositoryImpl → TodoDao → Hive

**Timer:** TimerCubit ticks locally each second (no storage writes per tick); elapsed seconds are persisted on pause/complete via `UpdateTimerSession`.

## Getting Started

```bash
cd simple_todo_timer_app
flutter pub get
flutter run
```

## Tests

26 tests cover the repository (against real Hive), both cubits (`bloc_test` + `fake_async`), and widget tests for the list and focus timer screens.

```bash
flutter analyze   # 0 issues
flutter test      # 26/26 passing
```

## Dependencies

| Package | Purpose |
|---|---|
| `flutter_bloc` / `bloc` | State management (Cubit) |
| `get_it` | Service locator |
| `go_router` | Navigation (`/`, `/timer/:id`) |
| `hive` / `hive_flutter` | Local storage |
| `equatable` | Value equality for states |
| `lucide_icons_flutter` | Icons |