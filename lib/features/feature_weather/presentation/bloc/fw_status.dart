import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/forecase_days_entity.dart';

@immutable
abstract class FwStatus extends Equatable {}

/// loading state
class FwLoading extends FwStatus {
  @override
  List<Object?> get props => [];
}

/// loaded state
class FwCompleted extends FwStatus {
  final ForecastDaysEntity forecastDaysEntity;
  FwCompleted(this.forecastDaysEntity);

  @override
  List<Object?> get props => [forecastDaysEntity];
}

/// error state
class FwError extends FwStatus {
  final String? message;
  FwError(this.message);

  @override
  List<Object?> get props => [message];
}
