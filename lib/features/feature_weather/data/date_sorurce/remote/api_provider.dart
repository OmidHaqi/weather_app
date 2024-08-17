import 'package:clean_arcitechture_edu/core/utils/constants.dart';
import 'package:dio/dio.dart';

import '../../../../../core/params/forecast_params.dart';

//*reciver the data

class ApiProvider {
  final Dio _dio = Dio();
  var apikey = Constants.apiKey1;

  //? current weather api call
  Future<dynamic> callCurrentWeather(cityName) async {
    var response = await _dio
        .get('${Constants.baseUrl}/data/2.5/weather', queryParameters: {
      'q': cityName,
      'appid': apikey,
      'units': 'metric',
    });
    return response;
  }

  //? 5 days forecast api
  Future<dynamic> sendRequest5DaysForcast(ForecastParams params) async {
    var response = await _dio.get('${Constants.baseUrl}/data/2.5/forecast',
        queryParameters: {
          'lat': params.lat,
          'lon': params.lon,
          'appid': apikey,
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
