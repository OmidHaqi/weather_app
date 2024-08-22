import 'package:equatable/equatable.dart';

import '../../data/model/forecast_days_model.dart';

class ForecastDaysEntity extends Equatable {
  final String? cod;
  final num? message;
  final num? cnt;
  final List<DataList>? list;
  final City? city;

  const ForecastDaysEntity({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  @override
  List<Object?> get props => [
        cod,
        message,
        cnt,
        list,
        city,
      ];
}
