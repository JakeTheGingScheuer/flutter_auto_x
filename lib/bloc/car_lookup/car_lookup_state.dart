import 'package:auto_x/data/model/car_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class CarLookupState extends Equatable {}

class CarLookupInitialState extends CarLookupState {
  @override
  List<Object> get props => [];
}

class CarLookupSelectedManufacturerState extends CarLookupState {
  final Manufacturer manufacturer;
  CarLookupSelectedManufacturerState({@required this.manufacturer});

  @override
  List<Object> get props => [manufacturer];
}

class CarLookupSelectedModelState extends CarLookupState {
  final Car car;
  CarLookupSelectedModelState({@required this.car});

  @override
  List<Object> get props => [car];
}