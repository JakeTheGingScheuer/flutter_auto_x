import 'package:auto_x/bloc/car_look_up/car_look_up_bloc.dart';
import 'package:auto_x/bloc/car_look_up/car_look_up_event.dart';
import 'package:auto_x/data/model/manufacturer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManufacturerSelectorWidget extends StatelessWidget {

  final List<Manufacturer> manufacturers;
  CarLookUpBloc carLookUpBloc;

  ManufacturerSelectorWidget({@required this.manufacturers});

  @override
  Widget build(BuildContext context) {
    carLookUpBloc = BlocProvider.of<CarLookUpBloc>(context);
    return Column(
      children: <Widget>[
        Text('Select Make'),
        Container(
          width: 300,
          child: DropdownButton(
            key: Key('ManufacturerSelector'),
            items: _manufacturerList(),
            onChanged: (val) => carLookUpBloc.add(SelectManufacturerEvent(manufacturer: val)),
          ),
        )
      ],
    );
  }

  _manufacturerList() {
    List<String> makes = List<String>();
    manufacturers.forEach((make) {
      makes.add(make.name);
    });
    return makes.map<DropdownMenuItem<String>>((String value) {
      return _manufacturerItem(value);
    }).toList();
  }

  _manufacturerItem(String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Container(width: 270, child: Text(value)),
    );
  }
}