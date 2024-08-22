import 'package:dio/dio.dart';

import '../../../../core/params/forecast_params.dart';
import '../../../../core/resources/date_state.dart';
import '../../domain/entities/current_city_entity.dart';
import '../../domain/entities/forecase_days_entity.dart';
import '../../domain/entities/suggest_city_entity.dart';
import '../../domain/repository/weather_repository.dart';
import '../date_source/remote/api_provider.dart';
import '../model/current_city_model.dart';
import '../model/forecast_days_model.dart';
import '../model/suggest_city_model.dart';

class WeatherRepositoryImpl extends IWeatherRepository {
  ApiProvider apiProvider;

  WeatherRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<CurrentCityEntity>> fetchCurrentWeatherData(
      String cityName) async {
    try {
      Response response = await apiProvider.callCurrentWeather(cityName);

      if (response.statusCode == 200) {
        CurrentCityEntity currentCityEntity =
            CurrentCityModel.fromJson(response.data);
        return DataSuccess(currentCityEntity);
      } else {
        return DataFailed('error');
      }
    } catch (e) {
      return DataFailed('error');
    }
  }

  @override
  Future<DataState<ForecastDaysEntity>> fetchForecastWeatherData(
      ForecastParams params) async {
    try {
      Response response = await apiProvider.sendRequest5DaysForecast(params);

      if (response.statusCode == 200) {
        ForecastDaysEntity forecastDaysEntity =
            ForecastDaysModel.fromJson(response.data);
        return DataSuccess(forecastDaysEntity);
      } else {
        return DataFailed("Something Went Wrong. try again...");
      }
    } catch (e) {
      print(e);
      return DataFailed("please check your connection...");
    }
  }

  @override
  Future<List<Data>> fetchSuggestData(cityName) async {
    Response response = await apiProvider.sendRequestCitySuggestion(cityName);
    SuggestCityEntity suggestCityEntity =
        SuggestCityModel.fromJson(response.data);

    return suggestCityEntity.data!;
  }
}
