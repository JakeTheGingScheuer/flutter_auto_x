import 'package:auto_x/bloc/car_look_up/car_look_up_bloc.dart';
import 'package:auto_x/bloc/car_look_up/car_look_up_event.dart';
import 'package:auto_x/data/model/car_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectorWidget extends StatelessWidget {
  final List<CarData> carData;
  CarLookUpBloc carLookUpBloc;
  int pickerIndex = 0;

  SelectorWidget({@required this.carData});

  @override
  Widget build(BuildContext context) {
    carLookUpBloc = BlocProvider.of<CarLookUpBloc>(context);
    return Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color.fromRGBO(225, 225, 225, 1)),
        width: 300,
        child: Column(children: [
          SizedBox(height: 10),
          Container(
            height: 200,
            child: CupertinoPicker(
                looping: true,
                itemExtent: 50,
                onSelectedItemChanged: (val) => this.pickerIndex = val,
                children: pickerObjects()),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
              backgroundColor: Colors.red,
              hoverColor: Colors.redAccent,
              splashColor: Colors.green,
              child: Icon(Icons.forward),
              onPressed: () => carLookUpBloc.add(determineEvent(pickerIndex))),
          SizedBox(height: 15)
        ]));
  }

  determineEvent(int index){
    if(carData[index] is Manufacturer){
      return SelectManufacturerEvent(manufacturer: carData[index]);
    } else {
      return SelectCarModelEvent(car: carData[index]);
    }
  }

  pickerObjects() {
    List<String> itemNames = List<String>();
    carData.forEach((_) {
      itemNames.add(_.name.replaceAll('_', ' '));
    });
    return itemNames.map<Center>((String value) {
      return Center(child: Text(value, style: TextStyle(fontSize: 16), textAlign: TextAlign.center));
    }).toList();
  }
}
