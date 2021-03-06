import 'package:auto_x/bloc/car_data/car_data_bloc.dart';
import 'package:auto_x/bloc/event_data/event_data_bloc.dart';
import 'package:auto_x/bloc/navigation/navigation_bloc.dart';
import 'package:auto_x/bloc/navigation/navigation_state.dart';
import 'package:auto_x/data/repository/car_data_repository.dart';
import 'package:auto_x/data/repository/event_data_repository.dart';
import 'package:auto_x/res/strings/strings.dart';
import 'package:auto_x/ui/pages/car_look_up_page.dart';
import 'package:auto_x/ui/pages/pdf_page.dart';
import 'package:auto_x/ui/widgets/navigation_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:localstorage/localstorage.dart';
import 'events_lookup_page.dart';
import '../../globals.dart' as globals;

class HomePage extends StatelessWidget {

  CarDataRepository carDataRepo;
  EventDataRepository eventDataRepo;

  HomePage(Client httpClient, LocalStorage localStorage){
    carDataRepo = CarDataRepositoryImpl(httpClient, localStorage);
    eventDataRepo = EventDataRepositoryImpl();
  }

  @override
  Widget build(BuildContext context) {
    globals.screenSize = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomPadding: true,
        body: BlocBuilder<NavigationBloc, NavigationState>(builder: (context, state)
              {
                if (state is NavigateToEventsState) {
                  return BlocProvider(
                      create: (_) => EventDataBloc(repository: eventDataRepo), child: EventsLookupPage());
                } else if (state is NavigateToModsState) {
                  return PdfPage(key: Key('modsPage'), file: AppStrings.modsInfo);
                } else if (state is NavigateToHelmetsState) {
                  return PdfPage(key: Key('helmetInfo'), file: AppStrings.helmetInfo);
                } else if (state is NavigateToRuleBookState) {
                  return PdfPage(key: Key('ruleBook'), file: AppStrings.ruleBook);
                } else if (state is NavigateToCarLookupState) {
                  return BlocProvider(
                      create: (_) => CarDataBloc(repository: carDataRepo), child: CarLookupPage());
                } else {
                  return NavigationWidget();
                }
              }),
    );
  }
}
