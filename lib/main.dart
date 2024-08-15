import 'package:clean_arcitechture_edu/features/feature_weather/data/date_sorurce/remote/api_provider.dart';
import 'package:clean_arcitechture_edu/features/feature_weather/data/repository/weather_repository_impl.dart';
import 'package:clean_arcitechture_edu/features/feature_weather/domain/use_cases/get_current_weather_use_case.dart';
import 'package:flutter/material.dart';
import 'core/widgets/main_wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    GetCurrentWeatherUseCase getCurrentWeatherUseCase =
        GetCurrentWeatherUseCase(WeatherRepositoryImpl(ApiProvider()));

    getCurrentWeatherUseCase('cityName');
    
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainWrapper(),
    );
  }
}
