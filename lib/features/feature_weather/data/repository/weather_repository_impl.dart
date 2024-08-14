import 'package:clean_arcitechture_edu/core/resources/date_state.dart';
import 'package:clean_arcitechture_edu/features/feature_weather/data/date_sorurce/remote/api_provider.dart';
import 'package:clean_arcitechture_edu/features/feature_weather/data/model/current_city_model.dart';
import 'package:clean_arcitechture_edu/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:clean_arcitechture_edu/features/feature_weather/domain/repository/weather_repository.dart';
import 'package:dio/dio.dart';

class WeatherRepositoryImpl extends IWeatherReporository {
   ApiProvider apiProvider;

  WeatherRepositoryImpl(this.apiProvider);

  @override
  Future<DateState<CurrentCityEntity>> fetchCurrentWeatherData(
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
}
