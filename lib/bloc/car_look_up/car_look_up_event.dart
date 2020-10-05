import 'package:auto_x/data/model/car.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class CarLookUpEvent extends Equatable {}

class SelectManufacturerEvent extends CarLookUpEvent {
  final Manufacturer manufacturer;
  SelectManufacturerEvent({@required this.manufacturer});

  @override
  List<Object> get props => [manufacturer];
}

class SelectCarModelEvent extends CarLookUpEvent {
  final Car car;
  SelectCarModelEvent({@required this.car});
  @override
  List<Object> get props => [car];
}

class ResetEvent extends CarLookUpEvent {
  @override
  List<Object> get props => null;
}