import 'package:auto_x/bloc/car_look_up/car_look_up_bloc.dart';
import 'package:auto_x/bloc/car_look_up/car_look_up_event.dart';
import 'package:auto_x/bloc/car_look_up/car_look_up_state.dart';
import 'package:auto_x/data/model/car.dart';
import 'package:auto_x/ui/widgets/selector_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarLookUpPage extends StatefulWidget {
  final List<Manufacturer> manufacturers;

  CarLookUpPage({@required this.manufacturers});

  @override
  _CarLookUpState createState() =>
      _CarLookUpState(manufacturers: this.manufacturers);
}

class _CarLookUpState extends State<CarLookUpPage> {
  CarLookUpBloc carLookUpBloc;
  final List<Manufacturer> manufacturers;

  _CarLookUpState({@required this.manufacturers});

  @override
  void initState() {
    super.initState();
    carLookUpBloc = BlocProvider.of<CarLookUpBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 10),
          Image(height: 200, image: AssetImage('assets/scca-logo.jpg')),
          SizedBox(height: 10),
          BlocBuilder<CarLookUpBloc, CarLookUpState>(builder: (context, state) {
            if (state is CarLookUpInitialState) {
              return new SelectorWidget(carData: manufacturers);
            } else if (state is CarLookUpSelectedManufacturerState) {
              return new SelectorWidget(carData: state.manufacturer.carModels);
            } else if (state is CarLookUpSelectedModelState) {
              return GestureDetector(
                  onTap: () => carLookUpBloc.add(ResetEvent()),
                  child: Center(
                      child: Text(state.car.carClass,
                          style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              shadows: [
                                Shadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 7,
                                    offset: Offset(0, 3))
                              ]))));
            } else {
              return Text('did not work');
            }
          }),
        ],
      ),
    );
  }
}
