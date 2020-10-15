import 'package:auto_x/bloc/car_data/car_data_bloc.dart';
import 'package:auto_x/bloc/car_data/car_data_event.dart';
import 'package:auto_x/bloc/car_data/cart_data_state.dart';
import 'package:auto_x/data/model/car_data.dart';
import 'package:auto_x/data/repository/car_data_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCarDataBloc extends MockBloc<CarDataEvent, CarDataState> implements CarDataBloc {}
class MockCarDataRepo extends Mock implements CarDataRepository{}

CarDataEvent fakeFetchDataEvent = FetchCarDataEvent();
Manufacturer fakeManufacturer = Manufacturer();


void main(){

  MockCarDataRepo mockCarDataRepo;

  setUp(() {
    mockCarDataRepo = MockCarDataRepo();
  });

  test('when given FetchData event and it is successful, returns loading state followed by loaded state', () async {
    CarDataBloc bloc = CarDataBloc(repository: mockCarDataRepo);
    when(mockCarDataRepo.getCarData()).thenAnswer((_) => Future.value([fakeManufacturer]));
    bloc.add(fakeFetchDataEvent);
    await emitsExactly(bloc, [isA<CarDataLoadingState>(), isA<CarDataLoadedState>()]);
  });

  test('when given FetchData event and it fails, returns loading state followed by error state', () async {
    CarDataBloc bloc = CarDataBloc(repository: mockCarDataRepo);
    when(mockCarDataRepo.getCarData()).thenThrow(Exception());
    bloc.add(fakeFetchDataEvent);
    await emitsExactly(bloc, [isA<CarDataLoadingState>(), isA<CarDataErrorState>()]);
  });
}