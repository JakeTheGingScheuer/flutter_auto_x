import 'package:auto_x/bloc/navigation/navigation_bloc.dart';
import 'package:auto_x/bloc/navigation/navigation_event.dart';
import 'package:auto_x/bloc/navigation/navigation_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test('When given navigate to car lookup event, returns navigate to car lookup state', () async{
    NavigationBloc bloc = NavigationBloc();
    NavigationEvent fakeEvent = NavigateToCarLookupEvent();
    bloc.add(fakeEvent);
    await emitsExactly(bloc, [isA<NavigateToCarLookupState>()]);
  });

  test('When given navigate to mods event, returns navigate to mods state', () async{
    NavigationBloc bloc = NavigationBloc();
    NavigationEvent fakeEvent = NavigateToModsEvent();
    bloc.add(fakeEvent);
    await emitsExactly(bloc, [isA<NavigateToModsState>()]);
  });

  test('When given navigate to events event, returns navigate to events state', () async{
    NavigationBloc bloc = NavigationBloc();
    NavigationEvent fakeEvent = NavigateToEventsEvent();
    bloc.add(fakeEvent);
    await emitsExactly(bloc, [isA<NavigateToEventsState>()]);
  });

  test('When given navigate to helmets event, returns navigate to helmets state', () async{
    NavigationBloc bloc = NavigationBloc();
    NavigationEvent fakeEvent = NavigateToHelmetsEvent();
    bloc.add(fakeEvent);
    await emitsExactly(bloc, [isA<NavigateToHelmetsState>()]);
  });

  test('When given navigate to rule book event, returns navigate to rule book state', () async{
    NavigationBloc bloc = NavigationBloc();
    NavigationEvent fakeEvent = NavigateToRuleBookEvent();
    bloc.add(fakeEvent);
    await emitsExactly(bloc, [isA<NavigateToRuleBookState>()]);
  });

  test('When given navigate home event, returns navigation initial state', () async{
    NavigationBloc bloc = NavigationBloc();
    NavigationEvent fakeEvent = NavigateHomeEvent();
    bloc.add(fakeEvent);
    await emitsExactly(bloc, [isA<NavigationInitialState>()]);
  });
}