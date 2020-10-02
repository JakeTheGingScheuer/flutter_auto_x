import 'package:auto_x/bloc/car_look_up/car_look_up_bloc.dart';
import 'package:auto_x/bloc/car_look_up/car_look_up_event.dart';
import 'package:auto_x/data/model/car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarModelSelectorWidget extends StatelessWidget {

  final List<Car> carModels;
  CarLookUpBloc carLookUpBloc;

  CarModelSelectorWidget({@required this.carModels});

  @override
  Widget build(BuildContext context) {
    carLookUpBloc = BlocProvider.of<CarLookUpBloc>(context);
    return Column(
      children: <Widget>[
        Text('Select Car Model'),
        Container(
          width: 300,
          child: DropdownButton(
            key: Key('CarModelSelector'),
            items: _carModelList(),
            onChanged: (val) => carLookUpBloc.add(SelectCarModelEvent(carModel: val, carClass: _getCarClass(val))),
          ),
        )
      ],
    );
  }

  _carModelList() {
    List<String> carModelsStrings = List<String>();
    carModels.forEach((carModel) {
      carModelsStrings.add(carModel.name);
    });
    return carModelsStrings.map<DropdownMenuItem<String>>((String value) {
      return _carModelItem(value);
    }).toList();
  }

  _carModelItem(String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Container(width: 270, child: Text(value)),
    );
  }

  _getCarClass(String carModelString){
    String carClass = 'N/A';
    for(Car car in carModels){
      if(car.name == carModelString){
        carClass = car.carClass;
      }
    }
    return carClass;
  }
}