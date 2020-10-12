import 'package:auto_x/bloc/navigation/navigation_event.dart';
import 'package:auto_x/bloc/navigation/navigation_state.dart';
import 'package:bloc/bloc.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  @override
  get initialState => NavigationInitialState();

  @override
  Stream<NavigationState> mapEventToState(event) async* {
    if (event is NavigateToCarLookupEvent) {
      yield NavigateToCarLookupState();
    } else if (event is NavigateToModsEvent) {
      yield NavigateToModsState();
    } else if (event is NavigateToEventsEvent) {
      yield NavigateToEventsState();
    } else if (event is NavigateToHelmetsEvent) {
      yield NavigateToHelmetsState();
    } else if (event is NavigateToRuleBookEvent) {
      yield NavigateToRuleBookState();
    } else {
      yield NavigationInitialState();
    }
  }
}
