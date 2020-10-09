import 'package:auto_x/bloc/event_data/event_data_bloc.dart';
import 'package:auto_x/bloc/event_data/event_data_event.dart';
import 'package:auto_x/bloc/event_data/event_data_state.dart';
import 'package:auto_x/data/repository/event_data_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockEventDataRepo extends Mock implements EventDataRepository{}

EventDataEvent fakeFetchEvent = FetchEventDataEvent();

void main(){
  MockEventDataRepo mockEventDataRepo;
  setUp(() {
    mockEventDataRepo = MockEventDataRepo();
  });

  test('when given FetchData event and is successful, returns a Loading state then an EventDataLoaded state', () async {
    EventDataBloc bloc = EventDataBloc(repository: mockEventDataRepo);
    when(mockEventDataRepo.getEventDataFromApi()).thenAnswer((_) => Future.value(["something"]));
    bloc.add(fakeFetchEvent);
    await emitsExactly(bloc, [isA<EventDataLoadingState>(), isA<EventDataLoadedState>()]);
  });

  test('when given FetchData event and fails, returns a Loading state then an EventDataError state', () async {
    EventDataBloc bloc = EventDataBloc(repository: mockEventDataRepo);
    when(mockEventDataRepo.getEventDataFromApi()).thenThrow(Exception());
    bloc.add(fakeFetchEvent);
    await emitsExactly(bloc, [isA<EventDataLoadingState>(), isA<EventDataErrorState>()]);
  });
}