
import 'package:equatable/equatable.dart';

import '../../data/model/suggest_city_model.dart';


class SuggestCityEntity extends Equatable{
  final List<Data>? data;
  final Metadata? metadata;


  const SuggestCityEntity({this.data, this.metadata});

  @override
  // TODO: implement props
  List<Object?> get props => [
    data,
    metadata,
  ];

  @override
  // TODO: implement stringify
  bool? get stringify => true;
}