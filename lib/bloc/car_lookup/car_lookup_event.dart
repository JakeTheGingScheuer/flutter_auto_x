import 'package:auto_x/data/model/car_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class CarLookupEvent extends Equatable {}

class SelectManufacturerEvent extends CarLookupEvent {
  final Manufacturer manufacturer;
  SelectManufacturerEvent({@required this.manufacturer});

  @override
  List<Object> get props => [manufacturer];
}

class SelectCarModelEvent extends CarLookupEvent {
  final Car car;
  SelectCarModelEvent({@required this.car});
  @override
  List<Object> get props => [car];
}

class ResetEvent extends CarLookupEvent {
  @override
  List<Object> get props => null;
}