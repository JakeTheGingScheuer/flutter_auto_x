import 'package:auto_x/bloc/car_look_up/car_look_up_event.dart';
import 'package:auto_x/bloc/car_look_up/car_look_up_state.dart';
import 'package:auto_x/data/repository/car_look_up_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class CarLookUpBloc extends Bloc<CarLookUpEvent, CarLookUpState> {
  CarLookUpRepository repository;
  CarLookUpBloc({@required this.repository});

  @override
  CarLookUpState get initialState => CarLookUpInitialState();

  @override
  Stream<CarLookUpState> mapEventToState(CarLookUpEvent event) async* {
    if (event is SelectManufacturerEvent){
      repository.captureManufacturer(event.manufacturer);
      yield CarLookUpSelectedManufacturerState(manufacturer: event.manufacturer);
    }
    else if (event is SelectCarModelEvent){
      repository.captureCarModel(event.car);
      yield CarLookUpSelectedModelState(car: event.car);
    }
    else if (event is ResetEvent){
      yield CarLookUpInitialState();
    }
    else {
      yield CarLookUpInitialState();
    }
  }
}