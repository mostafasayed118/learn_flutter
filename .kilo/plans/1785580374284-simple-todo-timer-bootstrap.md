# Plan: simple_todo_timer_app bootstrap + core features

## Verified context
Project is greenfield. Only `INSTRUCTIONS.md` and `SPEC_KIT.md` exist. No `pubspec.yaml`, no `lib/` directory. Full bootstrap is required.

## Tech stack (from INSTRUCTIONS.md + SPEC)
- Flutter 3.x, Dart 3
- flutter_bloc + bloc, equatable, get_it, go_router
- hive + hive_flutter + hive_generator + build_runner
- flutter_animate, lucide_icons
- uuid

## Task branch
`feat/todo-timer-bootstrap`

## Files to create (in implementation order)

### 1. Project bootstrap
| File | Purpose |
|------|---------|
| `pubspec.yaml` | Dependencies listed above |
| `analysis_options.yaml` | Strict linting (dart_lints + flutter_lints) |
| `lib/main.dart` | Hive init, GetIt wiring, runApp, GoRouter |

### 2. Core layer (`lib/core/`)
| File | Purpose |
|------|---------|
| `core/entities/todo.dart` | `Todo` entity (id, title, isCompleted, focusSeconds, createdAt) |
| `core/error/app_error.dart` | Sealed `AppError` (database, unknown) |
| `core/error/result.dart` | `Result<T>` type alias (`Either<AppError, T>` or manual) |

### 3. Data layer (`lib/data/`)
| File | Purpose |
|------|---------|
| `data/database/hive_service.dart` | Hive init, `TodoBox` provider |
| `data/database/todo_dao.dart` | CRUD against Hive `Box<Todo>` |
| `data/models/todo_hive.dart` | Hive type adapter for `Todo` (codegen) |
| `data/repositories/todo_repository_impl.dart` | DAO → domain mapping, returns `Result<T>` |

### 4. Domain layer (`lib/features/todos/domain/`)
| File | Purpose |
|------|---------|
| `domain/repositories/todo_repository.dart` | Repository interface |
| `domain/usecases/add_todo.dart` | Thin wrapper |
| `domain/usecases/delete_todo.dart` | Thin wrapper |
| `domain/usecases/toggle_todo.dart` | Thin wrapper |
| `domain/usecases/get_todos.dart` | Thin wrapper |
| `domain/usecases/update_timer_session.dart` | Thin wrapper for start/stop/pause |

### 5. Presentation layer (`lib/features/todos/presentation/`)
| File | Purpose |
|------|---------|
| `presentation/cubits/todo_cubit.dart` | State: Loading, Loaded, Error. Methods: load, add, delete, toggle |
| `presentation/cubits/timer_cubit.dart` | State: Idle, Running, Paused. Uses `Stream.periodic` for tick. Does NOT go through use case/repository for tick |
| `presentation/pages/todo_list_page.dart` | Main screen: list + FAB + empty state |
| `presentation/pages/focus_timer_page.dart` | 2nd screen: MM:SS + play/pause/reset + todo title |
| `presentation/widgets/todo_item.dart` | Row with title, checkbox, timer badge |
| `presentation/widgets/timer_display.dart` | Animated MM:SS + controls |

### 6. Shared (`lib/shared/`)
| File | Purpose |
|------|---------|
| `shared/routing/app_router.dart` | GoRouter: `/` → TodoList, `/timer/:id` → FocusTimer |
| `shared/theme/app_theme.dart` | Material 3 theme, color scheme, text styles |

## State shapes

**TodoState** (Equatable)
- `TodoInitial`
- `TodoLoading`
- `TodoLoaded(List<Todo> todos)`
- `TodoError(String message)`

**TimerState** (Equatable)
- `TimerIdle(String? todoId)`
- `TimerRunning(String todoId, int elapsedSeconds)`
- `TimerPaused(String todoId, int elapsedSeconds)`

## Data flow

**Todo CRUD:**
`UI → TodoCubit → UseCase → TodoRepository → TodoRepositoryImpl → TodoDao → Hive`

**Timer:**
`UI → TimerCubit.start() → update_timer_session UseCase → TodoRepository → Hive`
`TimerCubit.tick() ← Stream.periodic every 1s (no repository hop)`
`UI → TimerCubit.pause/complete → update_timer_session UseCase → Hive`

## Dependencies (pubspec.yaml)
```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^8.1.6
  bloc: ^8.1.4
  equatable: ^2.0.5
  get_it: ^7.6.7
  go_router: ^14.2.7
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  flutter_animate: ^4.5.0
  lucide_icons: ^0.317.0
  uuid: ^4.0.0

dev_dependencies:
  build_runner: ^2.4.13
  hive_generator: ^2.0.1
  flutter_test:
    sdk: flutter
  bloc_test: ^9.1.7
  mocktail: ^1.0.3
```

## Testing strategy
- `TodoCubit`: bloc_test for load/add/delete/toggle/error
- `TimerCubit`: bloc_test + FakeAsync for start/tick/pause/complete
- `TodoRepositoryImpl`: unit test with in-memory Hive
- `TodoListPage`: widget_test for list, empty state, FAB
- `FocusTimerPage`: widget_test for display and controls
- Skip: flutter_animate visual assertions, integration tests

## Risks (already identified, accepted)
1. **Background timer:** Stream.periodic pauses when backgrounded. Handle via `WidgetsBindingObserver` — acceptable for scope.
2. **Hive init race:** Init in `main()` before `runApp()`.
3. **build_runner:** First setup requires `flutter pub run build_runner build`.
4. **Timer state not persisted:** Out of scope.

## Implementation order
1. pubspec + analysis_options
2. core/ entities + error types
3. data/ Hive setup + DAO + model + repository
4. domain/ repository interface + use cases
5. presentation/ cubits
6. presentation/ pages + widgets
7. shared/ theme + routing
8. main.dart wiring
9. run build_runner
10. tests

## Validation
- `flutter pub get`
- `flutter pub run build_runner build`
- `flutter analyze`
- `flutter test`
