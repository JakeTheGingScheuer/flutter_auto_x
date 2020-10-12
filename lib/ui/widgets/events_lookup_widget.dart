import 'package:auto_x/res/screen_dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'home_page_button.dart';

class EventsLookupWidget extends StatelessWidget {
  int pickerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column( children: [
          SizedBox(height: 20),
          HomePageButton(),
          SizedBox(height: 40),
          Row(
            children: [
              marginSpace(context),
              Container(width: screenWidth(context) * 0.2, child: Text('Zip Code')),
              Container(width: screenWidth(context) * 0.6, child: CupertinoTextField(keyboardType: TextInputType.number)),
              marginSpace(context)
            ],
          ),
          SizedBox(height: screenWidth(context)*0.1),
          Text('Radius'),
          SizedBox(height: screenWidth(context)*0.05),
          Container(
            width: screenWidth(context)*0.8,
            height: screenHeight(context)*0.15,
            child: CupertinoPicker(
              looping: true,
              itemExtent: 50,
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
    ]));
  }

  _setIndex(val) {
    this.pickerIndex = val;
    HapticFeedback.selectionClick();
    print(val);
  }

  pickerObject(value) {
    return Center(child: Text(value, style: TextStyle(fontSize: 16), textAlign: TextAlign.center));
  }
}
