import 'package:auto_x/bloc/homepage/home_page_bloc.dart';
import 'package:auto_x/bloc/homepage/home_page_event.dart';
import 'package:auto_x/bloc/homepage/home_page_state.dart';
import 'package:auto_x/data/model/manufacturer.dart';
import 'package:auto_x/data/repository/manufacturer_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockHomePageBloc extends MockBloc<HomePageEvent, HomePageState> implements HomePageBloc {}
class MockHomePageRepo extends Mock implements ManufacturerRepository{}

HomePageEvent fakeFetchDataEvent = FetchCarDataEvent();
Manufacturer fakeManufacturer = Manufacturer();


void main(){

  MockHomePageRepo mockHomePageRepo;

  setUp(() {
    mockHomePageRepo = MockHomePageRepo();
  });

  test('when given FetchData event, returns homepage loading state', () async {
    HomePageBloc bloc = HomePageBloc(repository: mockHomePageRepo);
    when(mockHomePageRepo.getManufacturers()).thenAnswer((_) => Future.value([fakeManufacturer]));
    bloc.add(fakeFetchDataEvent);
    await emitsExactly(bloc, [isA<HomePageLoadingState>(), isA<HomePageLoadedState>()]);
  });

  test('when given FetchData event, and it cannot connect returns HomePageErrorState', () async {
    HomePageBloc bloc = HomePageBloc(repository: mockHomePageRepo);
    when(mockHomePageRepo.getManufacturers()).thenThrow(Exception());
    bloc.add(fakeFetchDataEvent);
    expect(() => mockHomePageRepo.getManufacturers(), throwsException);
    await emitsExactly(bloc, [isA<HomePageLoadingState>(), isA<HomePageErrorState>()]);
  });
}