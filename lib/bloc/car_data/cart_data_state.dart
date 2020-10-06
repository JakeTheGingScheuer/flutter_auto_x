import 'package:auto_x/data/model/car_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class CarDataState extends Equatable {}

class CarDataInitialState extends CarDataState {
  @override
  List<Object> get props => [];
}

class CarDataLoadingState extends CarDataState {
  @override
  List<Object> get props => [];
}

class CarDataLoadedState extends CarDataState {
  List<Manufacturer> manufacturers;
  CarDataLoadedState({@required this.manufacturers});

  @override
  List<Object> get props => [manufacturers];
}

class CarDataErrorState extends CarDataState {
  String message;
  CarDataErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}