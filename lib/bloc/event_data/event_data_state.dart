import 'package:equatable/equatable.dart';

abstract class EventDataState extends Equatable{}

class EventDataInitialState extends EventDataState {
  @override
  List<Object> get props => [];
}

class EventDataLoadingState extends EventDataState {
  @override
  List<Object> get props => [];
}

class EventDataLoadedState extends EventDataState {
  var res;

  EventDataLoadedState(this.res);

  @override
  List<Object> get props => [res];
}

class EventDataErrorState extends EventDataState {
  @override
  List<Object> get props => [];
}