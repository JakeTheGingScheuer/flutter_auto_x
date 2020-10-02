import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class CarLookUpEvent extends Equatable {}

class SelectManufacturerEvent extends CarLookUpEvent {
  final String manufacturer;
  SelectManufacturerEvent({@required this.manufacturer});

  @override
  List<Object> get props => [manufacturer];
}

class SelectCarModelEvent extends CarLookUpEvent {
  final String carModel;
  final String carClass;
  SelectCarModelEvent({@required this.carModel, @required this.carClass});
  @override
  List<Object> get props => [carModel, carClass];
}

class ResetEvent extends CarLookUpEvent {
  @override
  List<Object> get props => null;
}