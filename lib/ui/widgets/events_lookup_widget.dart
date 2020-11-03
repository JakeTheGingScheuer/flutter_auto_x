import 'package:auto_x/bloc/event_data/event_data_bloc.dart';
import 'package:auto_x/bloc/event_data/event_data_event.dart';
import 'package:auto_x/res/strings/strings.dart';
import 'package:auto_x/responsive.dart';
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
            SizedBox(height: Responsive.mediumSpace),
            HomePageButton(),
            SizedBox(height: Responsive.XLSpace),
            Image(width: Responsive.XLLogo, image: AssetImage(AppStrings.motorSportReg)),
            SizedBox(height: Responsive.XLSpace),
            Row(
              children: [
                SizedBox(width:Responsive.largeSpace),
                Container(width: Responsive.large, child: Text('Zip Code', style: inputTitleStyle())),
                SizedBox(width: Responsive.smallSpace),
                Container(width: Responsive.large,
                    child: CupertinoTextField(
                        keyboardType: TextInputType.number,
                      onChanged: (val) => this.zipCode=val,
                    )),
                SizedBox(width:responsiveLogicalPixels(10))
              ],
            ),
            SizedBox(height: Responsive.XLSpace),
            Row(children: [
              SizedBox(width: Responsive.largeSpace),
              Container(width: Responsive.large, child: Text('Search Radius', style: inputTitleStyle())),
              SizedBox(width: Responsive.smallSpace),
              Container(
                width: Responsive.large,
                height: Responsive.medium,
                child: CupertinoPicker(
                  looping: true,
                  itemExtent: Responsive.small,
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
            SizedBox(height: Responsive.XLSpace),
            FloatingActionButton(
                backgroundColor: Colors.red,
                hoverColor: Colors.redAccent,
                splashColor: Colors.black45,
                child: Icon(Icons.forward),
                onPressed: () async => _bloc.add(FetchEventDataEvent(this.zipCode, this.searchRadius))
            ),
            SizedBox(height: Responsive.XLSpace)
      ])),
    );
  }

  _setIndex(val) {
    this.searchRadius = searchRadiusChoices[val];
    HapticFeedback.selectionClick();
  }

  pickerObject(value) {
    return Center(child: Text(value, style: TextStyle(fontSize: Responsive.mediumFont), textAlign: TextAlign.center));
  }

  inputTitleStyle() {
    return TextStyle(
        fontSize: Responsive.mediumFont,
        fontWeight: FontWeight.bold,
        shadows: [Shadow(color: Colors.grey.withOpacity(0.5), blurRadius: 7, offset: Offset(0, 3))]
    );
  }
}
