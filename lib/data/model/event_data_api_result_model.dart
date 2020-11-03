import 'dart:convert';

import 'package:xml2json/xml2json.dart';

class EventDataApiResultModel{
  final myTransformer = Xml2Json();
  var events;
  var names;
  var dates;
  var types;
  var venues;

  EventDataApiResultModel(responseBody){
    myTransformer.parse(responseBody);
    var res = jsonDecode(myTransformer.toParker());
    events = res['response']['events']['event'];
    for(int i=0; i<events.length; i++){
      names.add(events[i]['name']);
      dates.add(events[i]['start']);
      types.add(events[i]['type']);
      venues.add(events[i]['venue']);
    }
  }

  printEvents(){
    print('-------------');
    print(events);
    print('-------------');
  }
  printNames(){
    print('-------------');
    print(names);
    print('-------------');
  }
  printVenues(){
    print('-------------');
    print(venues);
    print('-------------');
  }
  printTypes(){
    print('-------------');
    print(types);
    print('-------------');
  }
  printDates(){
    print('-------------');
    print(dates);
    print('-------------');
  }
}