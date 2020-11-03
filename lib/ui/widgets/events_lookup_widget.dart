import 'package:auto_x/bloc/event_data/event_data_bloc.dart';
import 'package:auto_x/bloc/event_data/event_data_event.dart';
import 'package:auto_x/res/strings/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_page_button.dart';

class EventsLookupWidget extends StatelessWidget {
  String searchRadius;
  String zipCode;
  final searchRadiusChoices = {
    0:'60',
    1:'120',
    2:'180',
    3:'300',
    4:'2000'
  };
  EventDataBloc _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<EventDataBloc>(context);
    return SingleChildScrollView(
      child: Container(
          child: Column( children: [
            SizedBox(height: 10),
            HomePageButton(),
            SizedBox(height: 10),
            Image(width: 300, image: AssetImage(AppStrings.motorSportReg)),
            SizedBox(height: 60),
            Row(
              children: [
                SizedBox(width:30),
                Container(width: 100, child: Text('Zip Code', style: inputTitleStyle())),
                SizedBox(width:10),
                Container(width: 150,
                    child: CupertinoTextField(
                        keyboardType: TextInputType.number,
                      onChanged: (val) => this.zipCode=val,
                    )),
                SizedBox(width:10)
              ],
            ),
            SizedBox(height: 60),
            Row(children: [
              SizedBox(width: 30),
              Container(width: 100, child: Text('Search Radius', style: inputTitleStyle())),
              Container(
                width: 200,
                height: 80,
                child: CupertinoPicker(
                  looping: true,
                  itemExtent: 40,
                  onSelectedItemChanged: (val) => _setIndex(val),
                  children: [
                    pickerObject('60 miles'),
                    pickerObject('120 miles'),
                    pickerObject('180 miles'),
                    pickerObject('300 miles'),
                    pickerObject('Anywhere')
                  ],
                ),
              )
            ]),
            SizedBox(height: 30),
            FloatingActionButton(
                backgroundColor: Colors.red,
                hoverColor: Colors.redAccent,
                splashColor: Colors.black45,
                child: Icon(Icons.forward),
                onPressed: () async => _bloc.add(FetchEventDataEvent(this.zipCode, this.searchRadius))
            )
      ])),
    );
  }

  _setIndex(val) {
    this.searchRadius = searchRadiusChoices[val];
    HapticFeedback.selectionClick();
  }

  pickerObject(value) {
    return Center(child: Text(value, style: TextStyle(fontSize: 15), textAlign: TextAlign.center));
  }

  inputTitleStyle() {
    return TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        shadows: [Shadow(color: Colors.grey.withOpacity(0.5), blurRadius: 7, offset: Offset(0, 3))]
    );
  }
}
