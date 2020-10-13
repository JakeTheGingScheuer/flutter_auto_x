import 'package:auto_x/bloc/car_lookup/car_lookup_bloc.dart';
import 'package:auto_x/bloc/car_lookup/car_lookup_event.dart';
import 'package:auto_x/data/model/car_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';

class SelectorWidget extends StatelessWidget {
  final List<CarData> carData;
  CarLookupBloc carLookupBloc;
  int pickerIndex = 0;
  var hFlexVal;
  var wFlexVal;

  SelectorWidget({@required this.carData});

  @override
  Widget build(BuildContext context) {
    hFlexVal = MediaQuery.of(context).size.height*0.05;
    wFlexVal = MediaQuery.of(context).size.width*0.1;
    carLookupBloc = BlocProvider.of<CarLookupBloc>(context);
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
        width: 9*hFlexVal,
        child: Column(children: [
          SizedBox(height: 0.5*hFlexVal),
          Container(
            height: 6*hFlexVal,
            child: CupertinoPicker(
                looping: true,
                itemExtent: 1.5*hFlexVal,
                onSelectedItemChanged: (val) => _setIndex(val),
                children: pickerObjects()),
          ),
          SizedBox(height: 0.5*hFlexVal),
          FloatingActionButton(
              backgroundColor: Colors.red,
              hoverColor: Colors.redAccent,
              splashColor: Colors.black45,
              child: Icon(Icons.forward),
              onPressed: () => carLookupBloc.add(determineEvent(pickerIndex))),
          SizedBox(height: 0.5*hFlexVal)
        ]));
  }

  _setIndex(val){
    this.pickerIndex = val;
    HapticFeedback.selectionClick();
  }

  determineEvent(int index){
    HapticFeedback.selectionClick();
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
