import 'package:auto_x/data/model/manufacturer.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class HomePageState extends Equatable {}

class HomePageInitialState extends HomePageState {
  @override
  List<Object> get props => [];
}

class HomePageLoadingState extends HomePageState {
  @override
  List<Object> get props => [];
}

class HomePageLoadedState extends HomePageState {
  List<Manufacturer> manufacturers;
  HomePageLoadedState({@required this.manufacturers});

  @override
  List<Object> get props => [manufacturers];
}

class HomePageErrorState extends HomePageState {
  String message;
  HomePageErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}