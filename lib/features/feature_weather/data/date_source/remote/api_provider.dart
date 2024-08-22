import 'package:dio/dio.dart';

import '../../../../../core/params/forecast_params.dart';
import '../../../../../core/utils/constants.dart';

//*receiver the data

class ApiProvider {
  final Dio _dio = Dio();
  var apiKey = Constants.apiKey1;

  //? current weather api call
  Future<dynamic> callCurrentWeather(cityName) async {
    var response = await _dio
        .get('${Constants.baseUrl}/data/2.5/weather', queryParameters: {
      'q': cityName,
      'appid': apiKey,
      'units': 'metric',
    });
    return response;
  }

  //? 5 days forecast api
  Future<dynamic> sendRequest5DaysForecast(ForecastParams params) async {
    var response = await _dio.get('${Constants.baseUrl}/data/2.5/forecast',
        queryParameters: {
          'lat': params.lat,
          'lon': params.lon,
          'appid': apiKey,
          'units': 'metric'
        });
    return response;
  }

  //? city name suggest api
  Future<dynamic> sendRequestCitySuggestion(String prefix) async {
    var response = await _dio.get(
        "http://geodb-free-service.wirefreethought.com/v1/geo/cities",
        queryParameters: {
          'limit': 7,
          'offset': 0,
          'namePrefix': prefix,
        });

    return response;
  }
}
