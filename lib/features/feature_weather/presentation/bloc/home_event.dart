part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadCwEvent extends HomeEvent {
  final String cityName;
  const LoadCwEvent(this.cityName);

}
