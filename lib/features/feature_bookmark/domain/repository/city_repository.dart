import '../../../../core/resources/date_state.dart';
import '../entities/city_entity.dart';

abstract class CityRepository {
  Future<DataState<CityEntity>> saveCityToDB(String cityName);

  Future<DataState<List<CityEntity>>> getAllCityFromDB();

  Future<DataState<CityEntity?>> findCityByName(String name);

  Future<DataState<String>> deleteCityByName(String name);
}
