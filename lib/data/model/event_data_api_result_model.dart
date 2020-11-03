import 'dart:convert';

import 'package:auto_x/data/model/event_data.dart';
import 'package:xml2json/xml2json.dart';

class EventDataApiResultModel{
  final myTransformer = Xml2Json();
  List<EventData> events = [];

  EventDataApiResultModel(responseBody){
    myTransformer.parse(responseBody);
    var res = jsonDecode(myTransformer.toParker());
    List rawEventData = res['response']['events']['event'];
    for(int i=0; i<rawEventData.length; i++){
      events.add(EventData.fromJson(rawEventData[i]));
    }
  }

  printEvents(){
    String x = '';
    for(int i=0; i< events.length; i++){
      x = x+events[i].toString();
    }
    return x;
  }
}