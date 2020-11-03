import 'package:auto_x/bloc/event_data/event_data_event.dart';
import 'package:auto_x/bloc/event_data/event_data_state.dart';
import 'package:auto_x/data/repository/event_data_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class EventDataBloc extends Bloc<EventDataEvent, EventDataState>{
  EventDataRepository repository;

  EventDataBloc({@required this.repository});

  @override
  EventDataState get initialState => EventDataInitialState();

  @override
  Stream<EventDataState> mapEventToState(EventDataEvent event) async*{
    if(event is FetchEventDataEvent) {
      yield EventDataLoadingState();
      try {
        var res = await this.repository.getEventDataFromApi(event.zipCode, event.radius);
        yield EventDataLoadedState(res);
      }
      catch (e) {
        yield EventDataErrorState();
      }
    }
  }
}