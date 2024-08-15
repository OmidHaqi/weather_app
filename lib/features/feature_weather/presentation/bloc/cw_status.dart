import 'package:clean_arcitechture_edu/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CwStatus {}

class CwLoading extends CwStatus {}

class CwCompleted extends CwStatus {
  final CurrentCityEntity currentCityEntity;

  CwCompleted(this.currentCityEntity);
}

class CwError extends CwStatus {
  final String message;

  CwError(this.message);
}
