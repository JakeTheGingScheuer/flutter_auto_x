import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class CarLookUpState extends Equatable {}

class CarLookUpInitialState extends CarLookUpState {
  @override
  List<Object> get props => [];
}

class CarLookUpSelectedManufacturerState extends CarLookUpState {
  final String manufacturer;
  CarLookUpSelectedManufacturerState({@required this.manufacturer});

  @override
  List<Object> get props => [manufacturer];
}

class CarLookUpSelectedModelState extends CarLookUpState {
  final String model;
  final String carClass;
  CarLookUpSelectedModelState({@required this.model, @required this.carClass});

  @override
  List<Object> get props => [model, carClass];
}