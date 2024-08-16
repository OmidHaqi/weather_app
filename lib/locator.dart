import 'package:get_it/get_it.dart';

import 'features/feature_weather/data/date_sorurce/remote/api_provider.dart';
import 'features/feature_weather/data/repository/weather_repository_impl.dart';
import 'features/feature_weather/domain/repository/weather_repository.dart';
import 'features/feature_weather/domain/use_cases/get_current_weather_use_case.dart';
import 'features/feature_weather/domain/use_cases/get_forecast_weather_usecase.dart';
import 'features/feature_weather/presentation/bloc/home_bloc.dart';

GetIt locator = GetIt.instance;

setUp() {
  //*ApiProvider
  locator.registerSingleton<ApiProvider>(
    ApiProvider(),
  );

  //*Repositories
  locator.registerSingleton<IWeatherRepository>(
    WeatherRepositoryImpl(
      locator(),
    ),
  );

  //*Usecase
  locator.registerSingleton<GetCurrentWeatherUseCase>(
    GetCurrentWeatherUseCase(
      locator(),
    ),
  );
  locator.registerSingleton<GetForecastWeatherUseCase>(
    GetForecastWeatherUseCase(
      locator(),
    ),
  );

  //*Bloc
  locator.registerSingleton<HomeBloc>(
    HomeBloc(locator(), locator()),
  );
}
