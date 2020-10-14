import 'package:auto_x/bloc/car_lookup/car_lookup_bloc.dart';
import 'package:auto_x/bloc/car_lookup/car_lookup_event.dart';
import 'package:auto_x/bloc/car_lookup/car_lookup_state.dart';
import 'package:auto_x/data/model/car_data.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('When given select manufacturer event, returns selected manufacture state', () async {
    CarLookupBloc bloc = CarLookupBloc();
    Manufacturer fakeManufacturer = Manufacturer();
    CarLookupEvent fakeEvent = SelectManufacturerEvent(manufacturer: fakeManufacturer);
    bloc.add(fakeEvent);
    await emitsExactly(bloc, [isA<CarLookupSelectedManufacturerState>()]);
  });

  test('When given select model event, returns selected model state with name', () async {
    CarLookupBloc bloc = CarLookupBloc();
    Car fakeCar = Car();
    CarLookupEvent fakeEvent = SelectCarModelEvent(car: fakeCar);
    bloc.add(fakeEvent);
    await emitsExactly(bloc, [isA<CarLookupSelectedModelState>()]);
  });

  test('When given a select event then a reset event, returns inital state', () async {
    CarLookupBloc bloc = CarLookupBloc();
    Car fakeCar = Car();
    CarLookupEvent fakeEvent1 = SelectCarModelEvent(car: fakeCar);
    CarLookupEvent fakeEvent2 = ResetEvent();
    bloc.add(fakeEvent1);
    bloc.add(fakeEvent2);
    await emitsExactly(bloc, [isA<CarLookupSelectedModelState>(), isA<CarLookupInitialState>()]);
  });
}