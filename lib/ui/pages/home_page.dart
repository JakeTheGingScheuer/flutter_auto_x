import 'package:auto_x/bloc/car_data/car_data_bloc.dart';
import 'package:auto_x/bloc/navigation/navigation_bloc.dart';
import 'package:auto_x/bloc/navigation/navigation_event.dart';
import 'package:auto_x/bloc/navigation/navigation_state.dart';
import 'package:auto_x/data/repository/car_data_repository.dart';
import 'package:auto_x/ui/pages/car_look_up_page.dart';
import 'package:auto_x/ui/widgets/navigation_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NavigationBloc navigationBloc;
  final CarDataRepository repo = CarDataRepositoryImpl();

  @override
  void initState() {
    super.initState();
    navigationBloc = BlocProvider.of<NavigationBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: true,
        body: Center(
          child: BlocBuilder<NavigationBloc, NavigationState>(builder: (context, state)
              {
                if (state is NavigateToEventsState) {
                  return Text("Events Page");
                } else if (state is NavigateToModsState) {
                  return Text("Mods Page");
                } else if (state is NavigateToCarLookupState) {
                  return BlocProvider(
                      create: (_) => CarDataBloc(repository: repo), child: CarLookupPage());
                } else {
                  return NavigationWidget();
                }
              }),
        )
    );
  }
}
