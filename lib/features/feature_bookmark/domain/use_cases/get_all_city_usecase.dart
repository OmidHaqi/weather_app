import '../../../../core/resources/date_state.dart';
import '../../../../core/use_case/use_case.dart';
import '../entities/city_entity.dart';
import '../repository/city_repository.dart';

class GetAllCityUseCase
    implements UseCase<DataState<List<CityEntity>>, NoParams> {
  final CityRepository _cityRepository;
  GetAllCityUseCase(this._cityRepository);

  @override
  Future<DataState<List<CityEntity>>> call(NoParams params) {
    return _cityRepository.getAllCityFromDB();
  }
}
