import 'package:clean_arcitechture_edu/core/use_case/use_case.dart';

import '../../../../core/resources/date_state.dart';
import '../entities/current_city_entity.dart';
import '../repository/weather_repository.dart';

class GetCurrentWeatherUseCase
    extends UseCase<DataState<CurrentCityEntity>, String> {
  final IWeatherRepository iWeatherReporository;

  GetCurrentWeatherUseCase(this.iWeatherReporository);

  @override
  Future<DataState<CurrentCityEntity>> call(String param) {
    return iWeatherReporository.fetchCurrentWeatherData(param);
  }
}
