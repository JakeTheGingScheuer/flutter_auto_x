import 'package:auto_x/bloc/car_lookup/car_lookup_bloc.dart';
import 'package:auto_x/bloc/car_lookup/car_lookup_state.dart';
import 'package:auto_x/data/model/car_data.dart';
import 'package:auto_x/ui/widgets/car_class_result_widget.dart';
import 'package:auto_x/ui/widgets/home_page_button.dart';
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
  var hFlexVal;
  var wFlexVal;

  _CarLookupState({@required this.manufacturers});

  @override
  void initState() {
    super.initState();
    carLookupBloc = BlocProvider.of<CarLookupBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    hFlexVal = MediaQuery.of(context).size.height*0.05;
    wFlexVal = MediaQuery.of(context).size.width*0.1;
    return Container(
      child: Column(
        children: [
          SizedBox(height: 0.5*hFlexVal),
          HomePageButton(),
          SizedBox(height: hFlexVal),
          Image(width: 7*wFlexVal, image: AssetImage('assets/scca-logo.jpg')),
          SizedBox(height: 0.5*hFlexVal),
          BlocBuilder<CarLookupBloc, CarLookupState>(builder: (context, state) {
            if (state is CarLookupInitialState) {
              return SelectorWidget(key: Key('manufacturerPicker'), carData: manufacturers);
            } else if (state is CarLookupSelectedManufacturerState) {
              return SelectorWidget(key: Key('modelPicker'), carData: state.manufacturer.carModels);
            } else if (state is CarLookupSelectedModelState) {
              CarClassResult result = CarClassResult(carClass: state.car.carClass);
              carLookupBloc.close();
              return result;
            } else {
              return Text('did not work');
            }
          }),
        ],
      ),
    );
  }
}
