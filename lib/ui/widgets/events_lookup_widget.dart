import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:auto_x/bloc/event_data/event_data_bloc.dart';
import 'package:auto_x/bloc/event_data/event_data_event.dart';
import 'package:auto_x/res/screen_dimensions.dart';
import 'package:auto_x/res/strings/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_page_button.dart';

class EventsLookupWidget extends StatelessWidget {
  String searchRadius;
  String zipCode;
  var hFlexVal;
  var wFlexVal;
  EventDataBloc _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<EventDataBloc>(context);
    hFlexVal = MediaQuery.of(context).size.height*0.05;
    wFlexVal = MediaQuery.of(context).size.width*0.1;
    return SingleChildScrollView(
      child: Container(
          child: Column( children: [
            SizedBox(height: hFlexVal),
            HomePageButton(),
            SizedBox(height: 2*hFlexVal),
            Image(width: 8*wFlexVal, image: AssetImage(AppStrings.motorSportReg)),
            SizedBox(height: hFlexVal),
            Row(
              children: [
                marginSpace(context),
                Container(width: 2*wFlexVal, child: Text('Zip Code', style: inputTitleStyle())),
                marginSpace(context),
                Container(width: 5*wFlexVal,
                    child: CupertinoTextField(
                        keyboardType: TextInputType.number,
                      onChanged: (val) => this.zipCode=val,
                    )),
                marginSpace(context)
              ],
            ),
            SizedBox(height: hFlexVal),
            Text('Radius', style: inputTitleStyle()),
            SizedBox(height: hFlexVal),
            Container(
              width: 8*wFlexVal,
              height: 2*hFlexVal,
              child: CupertinoPicker(
                looping: true,
                itemExtent: 30,
                onSelectedItemChanged: (val) => _setIndex(val),
                children: [
                  pickerObject('60 miles'),
                  pickerObject('120 miles'),
                  pickerObject('180 miles'),
                  pickerObject('300 miles'),
                  pickerObject('Anywhere')
                ],
              ),
            ),
            SizedBox(height: hFlexVal),
            FloatingActionButton(
                backgroundColor: Colors.red,
                hoverColor: Colors.redAccent,
                splashColor: Colors.black45,
                child: Icon(Icons.forward),
                onPressed: () async {
                  _bloc.add(FetchEventDataEvent(this.zipCode, this.searchRadius));
//                  add a fetch data event with the values postalcode and radius
                  return await playLocalAsset();
                }),
      ])),
    );
  }

  _setIndex(val) {
    var searchRadius = {
      0:'60',
      1:'120',
      2:'180',
      3:'300',
      4:'2000'
    };
    this.searchRadius = searchRadius[val];
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

  Future<AudioPlayer> playLocalAsset() async {
    AudioCache cache = new AudioCache();
    return await cache.play(AppStrings.rick);
  }
}
