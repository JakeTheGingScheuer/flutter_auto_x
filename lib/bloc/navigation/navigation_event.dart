import 'package:equatable/equatable.dart';

abstract class NavigationEvent extends Equatable {}

class NavigateToCarLookupEvent extends NavigationEvent {
  @override
  List<Object> get props => null;
}

class NavigateToEventsEvent extends NavigationEvent {
  @override
  List<Object> get props => null;
}

class NavigateToModsEvent extends NavigationEvent {
  @override
  List<Object> get props => null;
}

class NavigateHomeEvent extends NavigationEvent {
  @override
  List<Object> get props => null;
}

class NavigateToHelmetsEvent extends NavigationEvent {
  @override
  List<Object> get props => null;
}
class NavigateToRuleBookEvent extends NavigationEvent {
  @override
  List<Object> get props => null;
}
