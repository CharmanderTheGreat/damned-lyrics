# Doqit

> **Do** + **Quick** + **It**

An offline, terminal-style sticky-note checklist app for Android. Fast to type, checklist-first, color-coded, with a home screen widget. Use it for daily to-dos, birthday planning, trips, or any list.

```
~/notes $ ls
[x] buy cake
[ ] gift for her
[ ] venue
progress: 1/3
```

## Features

### v1 (core)
- Quick capture: the keyboard is focused on a new note as soon as the app opens
- Notes with a title, color tag, and checklist items
- Color coding (ANSI-style tags)
- Progress counter per note (`3/8`)
- Pin and archive, with undo
- Templates (birthday, trip)
- Per-note reminders (local notifications, works offline)
- JSON export / import for backup
- 100% offline: no account, no internet permission

### v2
- Interactive home screen widget (tickable items, quick-add button)
- Drag-to-reorder checklist items
- Filter by color tag

## Color tags

| Tag    | Color   | Use                   |
|--------|---------|-----------------------|
| daily  | green   | everyday tasks        |
| event  | magenta | birthdays, gatherings |
| trip   | cyan    | trips, outings        |
| work   | yellow  | school / work         |
| urgent | red     | time-sensitive        |

Only the tag and progress bar are colored, not the whole card, to keep notes readable.

## Tech stack

| Layer          | Choice                        |
|----------------|-------------------------------|
| Framework      | Flutter (Android target)      |
| State          | Riverpod                      |
| Local database | Drift (SQLite)                |
| Reminders      | flutter_local_notifications   |
| Widget         | home_widget + Kotlin (native) |
| Font           | JetBrains Mono                |

## Project structure (planned)

```
doqit/
├── lib/
│   ├── main.dart
│   ├── core/
│   │   ├── theme/          # terminal theme, colors, typography
│   │   └── constants/
│   ├── data/
│   │   ├── database.dart   # Drift schema
│   │   ├── models/
│   │   └── repositories/
│   ├── features/
│   │   ├── notes/          # list, editor, templates
│   │   ├── reminders/
│   │   └── backup/         # JSON export / import
│   └── widgets/            # shared UI components
├── android/
│   └── app/src/main/kotlin/   # home screen widget (native)
├── pubspec.yaml
└── README.md
```

## Getting started

### Requirements
- Flutter SDK (stable)
- Android Studio, or the Android SDK with a device/emulator

### Run

```bash
git clone <repo-url>
cd doqit
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

### Build APK

```bash
flutter build apk --release
```

Output: `build/app/outputs/flutter-apk/app-release.apk`

> For release builds, set up a signing key first (`key.properties` + keystore). Never commit the keystore or `key.properties`.

## Roadmap

1. [ ] Project setup and database schema
2. [ ] Home screen and note editor
3. [ ] Color tags, templates, pin / archive / undo
4. [ ] Reminders
5. [ ] JSON backup (export / import)
6. [ ] Home screen widget
7. [ ] Release APK

## Privacy

All data stays on the device. No cloud, no analytics, no tracking. Use JSON export for backups, since data is lost if the phone is lost or reset.

## License

TBD