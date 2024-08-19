# Weather App

A weather forecasting application built with Flutter, following Clean Architecture principles with a feature-based folder structure. The app features a modern blurry UI theme and offers functionalities like current weather, 5-day forecasts, and city bookmarking. This project integrates with the OpenWeatherMap API for weather data and uses the GeoDB Cities API for city selection.

> [!IMPORTANT]
> The purpose of this code is to implement Clean Architecture in the program.
> You may notice bugs in the UI. If so, please submit an issue or a pull request.


## Features

- **Current Weather Data**: Fetch weather updates.
- **5-Day Forecast**: View detailed weather forecasts for the next five days.
- **City Bookmarking**: Save your favorite cities for quick access to weather updates.
- **Blurry UI Design**: Enjoy a visually appealing, modern interface.
- **Feature-Based Clean Architecture**: Organized code structure to separate concerns and enhance maintainability.
- **Comprehensive Testing**: Includes unit tests, bloc tests, and UI tests.

## Getting Started

### Prerequisites

Ensure you have the following installed:

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)


### API Key Setup

This app requires an API key from OpenWeatherMap to fetch weather data. Follow the steps below to obtain and configure your API key:

1. **Get an API Key from OpenWeatherMap:**

    - Visit the [OpenWeatherMap website](https://home.openweathermap.org/users/sign_up) and create an account if you don't have one.
    - After signing up, log in to your account.
    - Navigate to the [API keys section](https://home.openweathermap.org/api_keys) in your profile.
    - Generate a new API key and copy it.

2. **Add the API Key to the Project:**

    - Open the file located at `lib/core/utils/constants.dart`.
    - Locate the `apiKey1` variable and replace its value with your OpenWeatherMap API key. It should look like this:

    ```dart
    class Constants {
      static const baseUrl = 'https://api.openweathermap.org';

      static const apiKey1 = 'YOUR_API_KEY_HERE'; // Add your API_KEY here
    }
    ```

    - Replace `'YOUR_API_KEY_HERE'` with the actual API key you obtained from OpenWeatherMap.


### Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/omidhaqi/weather_app.git
    ```

2. Navigate to the project directory:

    ```bash
    cd weather_app
    ```

3. Install dependencies:

    ```bash
    flutter pub get
    ```

### Running the App

To run the app on a connected device or emulator, use:

```bash
flutter run
```

### Running Tests

To run all the tests, use:

```bash
flutter test
```

To run tests with coverage:

```bash
flutter test --coverage
```

To run a specific test file:

```bash
flutter test test/<test_file_name>.dart
```

### Code Coverage (Optional)

To generate a code coverage report:

1. Run tests with coverage:

    ```bash
    flutter test --coverage
    ```

2. Generate and view the coverage report:

    ```bash
    genhtml coverage/lcov.info -o coverage/html
    ```

3. Open `coverage/html/index.html` in your browser to view the detailed report.

## Project Structure

This project follows a **feature-based Clean Architecture** structure. Each feature is organized into its own folder with separate layers for data, domain, and presentation:

```bash
lib
├── core
│   ├── params
│   │   └── forecast_params.dart
│   ├── resources
│   │   └── date_state.dart
│   ├── use_case
│   │   └── use_case.dart
│   ├── utils
│   │   ├── constants.dart
│   │   ├── date_converter.dart
│   │   └── themes.dart
│   └── widgets
│       ├── app_background.dart
│       ├── bottom_nav.dart
│       ├── dot_loading_widget.dart
│       └── main_wrapper.dart
├── features
│   ├── feature_bookmark
│   │   ├── data
│   │   │   ├── date_source
│   │   │   │   └── local
│   │   │   │       ├── city_dao.dart
│   │   │   │       ├── database.dart
│   │   │   │       └── database.g.dart
│   │   │   └── repository
│   │   │       └── city_repositoryimpl.dart
│   │   ├── domain
│   │   │   ├── entities
│   │   │   │   └── city_entity.dart
│   │   │   ├── repository
│   │   │   │   └── city_repository.dart
│   │   │   └── use_cases
│   │   │       ├── delete_city_usecase.dart
│   │   │       ├── get_all_city_usecase.dart
│   │   │       ├── get_city_usecase.dart
│   │   │       └── save_city_usecase.dart
│   │   └── presentation
│   │       ├── bloc
│   │       │   ├── bookmark_bloc.dart
│   │       │   ├── bookmark_event.dart
│   │       │   ├── bookmark_state.dart
│   │       │   ├── delete_city_status.dart
│   │       │   ├── get_all_city_status.dart
│   │       │   ├── get_city_status.dart
│   │       │   └── save_city_status.dart
│   │       ├── screens
│   │       │   └── bookmark_screen.dart
│   │       └── widgets
│   └── feature_weather
│       ├── data
│       │   ├── date_sorurce
│       │   │   └── remote
│       │   │       └── api_provider.dart
│       │   ├── model
│       │   │   ├── current_city_model.dart
│       │   │   ├── forecast_days_model.dart
│       │   │   └── suggest_city_model.dart
│       │   └── repository
│       │       └── weather_repository_impl.dart
│       ├── domain
│       │   ├── entities
│       │   │   ├── current_city_entity.dart
│       │   │   ├── forecase_days_entity.dart
│       │   │   └── suggest_city_entity.dart
│       │   ├── repository
│       │   │   └── weather_repository.dart
│       │   └── use_cases
│       │       ├── get_current_weather_usecase.dart
│       │       ├── get_forecast_weather_usecase.dart
│       │       └── get_suggestion_city_usecase.dart
│       └── presentation
│           ├── bloc
│           │   ├── cw_status.dart
│           │   ├── fw_status.dart
│           │   ├── home_bloc.dart
│           │   ├── home_event.dart
│           │   └── home_state.dart
│           ├── screens
│           │   └── home_screen.dart
│           └── widgets
│               ├── bookmark_icon.dart
│               ├── city_search.dart
│               └── day_weather_view.dart
├── locator.dart
└── main.dart

36 directories, 52 files
```

### Floor and SQLite Integration

- The **Data Layer** of the `feature_bookmark` module uses **Floor** and **SQLite** for local data persistence.
- **Floor** serves as an abstraction layer over **SQLite**, simplifying database interactions.
- The repository implementation in `feature_bookmark/data/repository/city_repositoryimpl.dart` interacts with Floor DAOs and SQLite directly to manage local city data.

## Libraries & Tools Used

- **[bloc](https://pub.dev/packages/bloc)** - State management.
- **[flutter_bloc](https://pub.dev/packages/flutter_bloc)** - Flutter widgets that integrate with Bloc.
- **[dio](https://pub.dev/packages/dio)** - Networking library.
- **[sqflite](https://pub.dev/packages/sqflite)** - Local database.
- **[floor](https://pub.dev/packages/floor)** - Database abstraction layer.
- **[equatable](https://pub.dev/packages/equatable)** - Simplifies equality comparisons.
- **[flutter_typeahead](https://pub.dev/packages/flutter_typeahead)** - Autocomplete text field.
- **[get_it](https://pub.dev/packages/get_it)** - Dependency injection.
- **[intl](https://pub.dev/packages/intl)** - Internationalization and localization.
- **[loading_animation_widget](https://pub.dev/packages/loading_animation_widget)** - Loading animations.
- **[smooth_page_indicator](https://pub.dev/packages/smooth_page_indicator)** - Page indicators.
- **[blurbox](https://pub.dev/packages/blurbox)** - Blurry UI components.
- **[mockito](https://pub.dev/packages/mockito)** - Mocking library for tests.
- **[bloc_test](https://pub.dev/packages/bloc_test)** - Testing library for Bloc.
- **[lints](https://pub.dev/packages/lints)** - Official Dart linter rules.

## API References

- **[OpenWeatherMap API](https://openweathermap.org/api)** - For weather data.
- **[GeoDB Cities API](https://rapidapi.com/wirefreethought/api/geodb-cities)** - For city search.

## Screenshots

|                                               |                                               |
| :-------------------------------------------: | :-------------------------------------------: |
| <Image src="/screenshots/0.png" width ="300"> | <Image src="/screenshots/1.png" width ="300"> |
| <Image src="/screenshots/2.png" width ="300"> | <Image src="/screenshots/3.png" width ="300"> |



---


## License

This project is licensed under the Apache License - see the [LICENSE](LICENSE) file for details.


##
##
<div align="center">

Version [0.0.1+1](https://github.com/omidhaqi/)

</div>
<div align="center">

Developed with  ☕ by [Umut](https://github.com/omidhaqi/)

</div>
