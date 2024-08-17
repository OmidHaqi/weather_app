import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/current_city_entity.dart';

@immutable
abstract class CwStatus extends Equatable {}

class CwLoading extends CwStatus {
  @override
  List<Object?> get props => [];
}

class CwCompleted extends CwStatus {
  final CurrentCityEntity currentCityEntity;
  CwCompleted(this.currentCityEntity);

  @override
  List<Object?> get props => [currentCityEntity];
}

class CwError extends CwStatus {
  final String message;
  CwError(this.message);

  @override
  List<Object?> get props => [message];
}
