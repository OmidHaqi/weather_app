import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@entity
// ignore: must_be_immutable
class CityEntity extends Equatable {
  @PrimaryKey(autoGenerate: true)
  int? id;

  final String name;

  CityEntity({required this.name});

  @override
  List<Object?> get props => [name];
}
