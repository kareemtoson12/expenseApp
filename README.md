# Expense App

A cross-platform expense tracking app built with Flutter, following Clean Architecture and best practices. The app uses Hive as a local database for fast, offline-first data storage.

## Features
- User authentication (signup, login)
- Add, view, update, and delete expenses
- Categorize expenses
- Store expenses locally using Hive
- Clean separation of data, domain, and presentation layers
- Dependency injection with GetIt
- Responsive UI

## Project Structure
```
lib/
  app/            # App-level setup, DI, routing, styles
  data/           # Data sources (local, remote), repositories implementations
  domain/         # Business logic: models, repositories, use cases
  presentation/   # UI: screens, cubits/blocs, widgets
```

## Local Database (Hive)
- Expenses are stored locally using Hive for fast, persistent, and offline access.
- Each expense has: category, amount, date, and an optional note.

## Clean Architecture
- **Domain Layer:** Business logic, models, repository interfaces, use cases
- **Data Layer:** Hive data source, repository implementations
- **Presentation Layer:** UI, state management (Cubit/Bloc)

## Getting Started

### Prerequisites
- [Flutter](https://flutter.dev/docs/get-started/install)
- Dart SDK

### Install Dependencies
```
flutter pub get
```

### Generate Hive Type Adapters
```
flutter pub run build_runner build --delete-conflicting-outputs
```

### Run the App
```
flutter run
```

## How to Add an Expense
- Use the UI to add a new expense (category, amount, date, note)
- Expenses are saved locally and displayed in the home screen

## Contributing
Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](LICENSE)
