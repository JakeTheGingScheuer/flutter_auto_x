abstract class EventDataEvent{}

class FetchEventDataEvent extends EventDataEvent {
  String zipCode;
  String radius;

  FetchEventDataEvent(this.zipCode, this.radius);
}

class EventDataLoadedEvent extends EventDataEvent {}