import 'package:auto_x/data/repository/car_look_up_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'car_lookup_event.dart';
import 'car_lookup_state.dart';

class CarLookupBloc extends Bloc<CarLookupEvent, CarLookupState> {
  CarLookupRepository repository;
  CarLookupBloc({@required this.repository});

  @override
  CarLookupState get initialState => CarLookupInitialState();

  @override
  Stream<CarLookupState> mapEventToState(CarLookupEvent event) async* {
    if (event is SelectManufacturerEvent){
      repository.captureManufacturer(event.manufacturer);
      yield CarLookupSelectedManufacturerState(manufacturer: event.manufacturer);
    }
    else if (event is SelectCarModelEvent){
      repository.captureCarModel(event.car);
      yield CarLookupSelectedModelState(car: event.car);
    }
    else if (event is ResetEvent){
      yield CarLookupInitialState();
    }
    else {
      yield CarLookupInitialState();
    }
  }
}