import 'package:clean_arcitechture_edu/core/use_case/use_case.dart';

import '../repository/weather_repository.dart';
import '../../../../core/resources/date_state.dart';
import '../entities/current_city_entity.dart';

class GetCurrentWeatherUseCase
    extends UseCase<DateState<CurrentCityEntity>, String> {
  final IWeatherReporository iWeatherReporository;

  GetCurrentWeatherUseCase(this.iWeatherReporository);

  @override
  Future<DateState<CurrentCityEntity>> call(String param) {
    return iWeatherReporository.fetchCurrentWeatherData(param);
  }

}
