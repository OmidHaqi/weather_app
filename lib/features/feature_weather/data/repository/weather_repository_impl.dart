import 'package:clean_arcitechture_edu/core/resources/date_state.dart';
import 'package:clean_arcitechture_edu/features/feature_weather/data/date_sorurce/remote/api_provider.dart';
import 'package:clean_arcitechture_edu/features/feature_weather/data/model/current_city_model.dart';
import 'package:clean_arcitechture_edu/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:clean_arcitechture_edu/features/feature_weather/domain/repository/weather_repository.dart';
import 'package:dio/dio.dart';

import '../../../../core/params/forecast_params.dart';
import '../../domain/entities/forecase_days_entity.dart';
import '../model/forecast_days_model.dart';

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
      Response response = await apiProvider.sendRequest5DaysForcast(params);

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
}
