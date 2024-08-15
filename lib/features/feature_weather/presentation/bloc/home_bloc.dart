import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/resources/date_state.dart';
import '../../domain/use_cases/get_current_weather_use_case.dart';
import 'cw_status.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCurrentWeatherUseCase getCurrentWeatherUseCase;

  HomeBloc(this.getCurrentWeatherUseCase)
      : super(
          HomeState(
            cwStatus: CwLoading(),
          ),
        ) {
    on<LoadCwEvent>(
      (event, emit) async {
        emit(
          state.copyWith(
            newCwStatus: CwLoading(),
          ),
        );

        DateState dataState = await getCurrentWeatherUseCase(event.cityName);

        if (dataState is DataSuccess) {
          emit(
            state.copyWith(
              newCwStatus: CwCompleted(dataState.data),
            ),
          );
        }
        if (dataState is DataFailed) {
          emit(
            state.copyWith(
              newCwStatus: CwError(dataState.error!),
            ),
          );
        }
      },
    );


  }
}
