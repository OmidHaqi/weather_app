import 'package:clean_arcitechture_edu/core/resources/date_state.dart';
import 'package:clean_arcitechture_edu/features/feature_weather/domain/entities/current_city_entity.dart';

abstract class IWeatherReporository {
Future<DateState<CurrentCityEntity>>  fetchCurrentWeatherData(String cityName);
}
