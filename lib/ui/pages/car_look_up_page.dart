import 'package:auto_x/bloc/car_data/car_data_bloc.dart';
import 'package:auto_x/bloc/car_data/car_data_event.dart';
import 'package:auto_x/bloc/car_data/cart_data_state.dart';
import 'package:auto_x/bloc/car_lookup/car_lookup_bloc.dart';
import 'package:auto_x/ui/widgets/spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/car_look_up_widget.dart';

class CarLookupPage extends StatefulWidget {
  @override
  _CarLookupPageState createState() => _CarLookupPageState();
}

class _CarLookupPageState extends State<CarLookupPage> {
  CarDataBloc carDataBloc;

  @override
  void initState() {
    super.initState();
    carDataBloc = BlocProvider.of<CarDataBloc>(context);
    carDataBloc.add(FetchCarDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarDataBloc, CarDataState>(builder: (context, state) {
            if (state is CarDataInitialState) {
              return Spinner();
            } else if (state is CarDataLoadingState) {
              return Spinner();
            } else if (state is CarDataErrorState) {
              return Text(state.message);
            } else if (state is CarDataLoadedState) {
              return BlocProvider(
                  create: (_) => CarLookupBloc(),
                  child: CarLookupWidget(manufacturers: state.manufacturers));
            } else {
              return Text("Nothing Happened");
            }
          });
  }
}
