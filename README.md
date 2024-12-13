# Cocktail App

A Flutter application that displays random cocktails using the CocktailDB API. This project demonstrates clean architecture, best practices, and proper code organization in Flutter.

## Features

- Display random cocktails with images and basic information
- Detailed view for each cocktail showing:
  - Ingredients and measurements
  - Instructions
  - Category and glass type
  - Alcoholic/Non-alcoholic status
- Pull to refresh functionality
- Error handling with user feedback
- Loading states
- Responsive design

## Project Structure

```
lib/
├── models/
│   └── cocktail.model.dart         # Data model for cocktail drinks
├── screens/
│   ├── widgets
│       └── cocktail_detail_widget.dart
│   ├── home_screen.dart   # Main screen with random cocktail
│   └── cocktail_details_screen.dart  # Detailed view of a cocktail
├── services/
│   └── cocktail.service.dart  # API communication layer
│   └── api.service.dart  # API client communication layer
└── main.dart             # App entry point
```

### Code Organization

The project follows these best practices:

1. **Separation of Concerns**

   - Models handle data structure and parsing
   - Services manage API communication
   - Screens handle UI and user interaction

2. **Single Responsibility**

   - Each file has a clear, single purpose
   - Logic is separated into appropriate layers

3. **Clean Architecture**

   - Clear separation between data, domain, and presentation layers
   - Easily maintainable and testable code structure

4. **Error Handling**
   - Comprehensive error handling throughout the app
   - User-friendly error messages

### Installation

1. Navigate to the project directory:

```bash
cd cocktail_app
```

3. Install dependencies:

```bash
flutter pub get
```

4. Run the app:

```bash
flutter run
```

- Since i have an issue, i used running on chrome

```bash
flutter run -d chrome
```

## API Reference

This app uses the [CocktailDB API](https://www.thecocktaildb.com/api.php)

Endpoint used:

- Random Cocktail: `https://www.thecocktaildb.com/api/json/v1/1/random.php`

## Dependencies

- `flutter`: The main framework
- `http`: For making API requests
