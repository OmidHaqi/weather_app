import '../../../../core/params/forecast_params.dart';
import '../../../../core/resources/date_state.dart';
import '../../data/model/suggest_city_model.dart';
import '../entities/current_city_entity.dart';
import '../entities/forecast_days_entity.dart';

abstract class IWeatherRepository {
  Future<DataState<CurrentCityEntity>> fetchCurrentWeatherData(String cityName);

  Future<DataState<ForecastDaysEntity>> fetchForecastWeatherData(
      ForecastParams params);

  Future<List<Data>> fetchSuggestData(cityName);
}
