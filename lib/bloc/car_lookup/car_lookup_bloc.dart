import 'package:bloc/bloc.dart';
import 'car_lookup_event.dart';
import 'car_lookup_state.dart';

class CarLookupBloc extends Bloc<CarLookupEvent, CarLookupState> {

  @override
  CarLookupState get initialState => CarLookupInitialState();

  @override
  Stream<CarLookupState> mapEventToState(CarLookupEvent event) async* {
    if (event is SelectManufacturerEvent){
      yield CarLookupSelectedManufacturerState(manufacturer: event.manufacturer);
    }
    else if (event is SelectCarModelEvent){
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