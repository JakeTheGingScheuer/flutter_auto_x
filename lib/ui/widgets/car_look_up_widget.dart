import 'package:auto_x/bloc/car_lookup/car_lookup_bloc.dart';
import 'package:auto_x/bloc/car_lookup/car_lookup_event.dart';
import 'package:auto_x/bloc/car_lookup/car_lookup_state.dart';
import 'package:auto_x/data/model/car_data.dart';
import 'package:auto_x/ui/widgets/car_class_result_widget.dart';
import 'package:auto_x/ui/widgets/selector_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarLookupWidget extends StatefulWidget {
  final List<Manufacturer> manufacturers;

  CarLookupWidget({@required this.manufacturers});

  @override
  _CarLookupState createState() => _CarLookupState(manufacturers: this.manufacturers);
}

class _CarLookupState extends State<CarLookupWidget> {
  CarLookupBloc carLookupBloc;
  final List<Manufacturer> manufacturers;

  _CarLookupState({@required this.manufacturers});

  @override
  void initState() {
    super.initState();
    carLookupBloc = BlocProvider.of<CarLookupBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 20),
          Container(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Icon(Icons.home),
              color: Colors.red,
              onPressed: () => carLookupBloc.add(ResetEvent()),
            ),
          ),
          SizedBox(height: 40),
          Image(width: 250, image: AssetImage('assets/scca-logo.jpg')),
          SizedBox(height: 30),
          BlocBuilder<CarLookupBloc, CarLookupState>(builder: (context, state) {
            if (state is CarLookupInitialState) {
              return SelectorWidget(carData: manufacturers);
            } else if (state is CarLookupSelectedManufacturerState) {
              return SelectorWidget(carData: state.manufacturer.carModels);
            } else if (state is CarLookupSelectedModelState) {
              return CarClassResult(carClass: state.car.carClass);
            } else {
              return Text('did not work');
            }
          }),
        ],
      ),
    );
  }
}
