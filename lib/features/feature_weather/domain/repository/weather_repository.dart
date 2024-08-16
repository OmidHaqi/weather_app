import 'package:clean_arcitechture_edu/core/resources/date_state.dart';
import 'package:clean_arcitechture_edu/features/feature_weather/domain/entities/current_city_entity.dart';

import '../../../../core/params/forecast_params.dart';
import '../entities/forecase_days_entity.dart';

abstract class IWeatherRepository {
  Future<DataState<CurrentCityEntity>> fetchCurrentWeatherData(String cityName);

  Future<DataState<ForecastDaysEntity>> fetchForecastWeatherData(
      ForecastParams params);
}
