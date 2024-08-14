import 'package:clean_arcitechture_edu/core/utils/constants.dart';
import 'package:dio/dio.dart';

//*reciver the data

class ApiProvider {
  final Dio _dio = Dio();
  var apikey = Constants.apiKay1;
  
  //? current weather api call
  Future<dynamic> callCurrentWeather(cityName) async {
    var response = await _dio.get(
      '${Constants.baseUrl}/date/2.5/weather',
      queryParameters: {
        'q': cityName,
        'appid': apikey,
        'units': 'metric',
      },
    );
    print(response.data);
    return response;
  }
}
