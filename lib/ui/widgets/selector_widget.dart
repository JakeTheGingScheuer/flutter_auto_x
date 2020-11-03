import 'package:auto_x/bloc/car_lookup/car_lookup_bloc.dart';
import 'package:auto_x/bloc/car_lookup/car_lookup_event.dart';
import 'package:auto_x/data/model/car_data.dart';
import 'package:auto_x/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';

class SelectorWidget extends StatelessWidget {
  final List<CarData> carData;
  CarLookupBloc carLookupBloc;
  int pickerIndex = 0;
  Key key;

  SelectorWidget({@required this.carData, this.key});

  @override
  Widget build(BuildContext context) {
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
        width: Responsive.XL,
        child: Column(children: [
          SizedBox(height: Responsive.smallSpace),
          Container(
            height: Responsive.XL,
            child: CupertinoPicker(
                looping: true,
                itemExtent: Responsive.small,
                onSelectedItemChanged: (val) => _setIndex(val),
                children: pickerObjects()),
          ),
          SizedBox(height: Responsive.smallSpace),
          FloatingActionButton(
              backgroundColor: Colors.red,
              hoverColor: Colors.redAccent,
              splashColor: Colors.black45,
              child: Icon(Icons.forward),
              onPressed: () => carLookupBloc.add(determineEvent(pickerIndex))),
          SizedBox(height: Responsive.mediumSpace)
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
      return Center(child: Text(value, style: TextStyle(fontSize: Responsive.mediumFont), textAlign: TextAlign.center));
    }).toList();
  }
}
