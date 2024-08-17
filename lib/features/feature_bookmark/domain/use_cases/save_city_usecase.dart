import '../../../../core/resources/date_state.dart';
import '../../../../core/use_case/use_case.dart';
import '../entities/city_entity.dart';
import '../repository/city_repository.dart';

class SaveCityUseCase implements UseCase<DataState<CityEntity>, String> {
  final CityRepository _cityRepository;
  SaveCityUseCase(this._cityRepository);

  @override
  Future<DataState<CityEntity>> call(String params) {
    return _cityRepository.saveCityToDB(params);
  }
}
