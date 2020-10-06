import 'package:auto_x/data/model/car_data.dart';
import 'package:auto_x/data/repository/car_data_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'car_data_event.dart';
import 'cart_data_state.dart';

class CarDataBloc extends Bloc<CarDataEvent, CarDataState> {
  CarDataRepository repository;

  CarDataBloc({@required this.repository});

  @override
  CarDataState get initialState => CarDataInitialState();

  @override
  Stream<CarDataState> mapEventToState(CarDataEvent event) async* {
    if (event is FetchCarDataEvent) {
      yield CarDataLoadingState();
      try {
        List<Manufacturer> manufacturers = await repository.getCarData();
        yield CarDataLoadedState(manufacturers: manufacturers);
      } catch (e) {
        yield CarDataErrorState(message: e.toString());
      }
    }
  }
}
