import '../../../../core/params/forecast_params.dart';
import '../../../../core/resources/date_state.dart';
import '../../../../core/use_case/use_case.dart';
import '../entities/forecase_days_entity.dart';
import '../repository/weather_repository.dart';

class GetForecastWeatherUseCase
    implements UseCase<DataState<ForecastDaysEntity>, ForecastParams> {
  final IWeatherRepository _weatherRepository;
  GetForecastWeatherUseCase(this._weatherRepository);

  @override
  Future<DataState<ForecastDaysEntity>> call(ForecastParams params) {
    return _weatherRepository.fetchForecastWeatherData(params);
  }
}
