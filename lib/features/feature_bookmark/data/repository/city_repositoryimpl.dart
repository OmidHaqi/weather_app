import '../../../../core/resources/date_state.dart';
import '../../domain/entities/city_entity.dart';
import '../../domain/repository/city_repository.dart';
import '../date_sorurce/local/city_dao.dart';

class CityRepositoryImpl extends CityRepository {
  CityDao cityDao;
  CityRepositoryImpl(this.cityDao);

  //? call save city to DB and set status
  @override
  Future<DataState<CityEntity>> saveCityToDB(String cityName) async {
    try {
      // check city exist or not
      CityEntity? checkCity = await cityDao.findCityByName(cityName);
      if (checkCity != null) {
        return DataFailed("$cityName has Already exist");
      }

      // insert city to database
      CityEntity city = CityEntity(name: cityName);
      await cityDao.insertCity(city);
      return DataSuccess(city);
    } catch (e) {
      print(e.toString());
      return DataFailed(e.toString());
    }
  }

  //? call get All city from DB and set status
  @override
  Future<DataState<List<CityEntity>>> getAllCityFromDB() async {
    try {
      List<CityEntity> cities = await cityDao.getAllCity();
      return DataSuccess(cities);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  //? call  get city by name from DB and set status
  @override
  Future<DataState<CityEntity?>> findCityByName(name) async {
    try {
      CityEntity? city = await cityDao.findCityByName(name);
      return DataSuccess(city);
    } catch (e) {
      print(e.toString());
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<String>> deleteCityByName(String name) async {
    try {
      await cityDao.deleteCityByName(name);
      return DataSuccess(name);
    } catch (e) {
      print(e.toString());
      return DataFailed(e.toString());
    }
  }
}
