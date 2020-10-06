import 'package:auto_x/data/model/car_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class CarLookUpState extends Equatable {}

class CarLookUpInitialState extends CarLookUpState {
  @override
  List<Object> get props => [];
}

class CarLookUpSelectedManufacturerState extends CarLookUpState {
  final Manufacturer manufacturer;
  CarLookUpSelectedManufacturerState({@required this.manufacturer});

  @override
  List<Object> get props => [manufacturer];
}

class CarLookUpSelectedModelState extends CarLookUpState {
  final Car car;
  CarLookUpSelectedModelState({@required this.car});

  @override
  List<Object> get props => [car];
}