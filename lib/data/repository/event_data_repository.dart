import 'dart:convert';
import 'package:auto_x/data/model/event_data_api_result_model.dart';
import 'package:auto_x/res/auth.dart';
import 'package:auto_x/res/strings/strings.dart';
import 'package:http/http.dart';
import 'package:xml2json/xml2json.dart';

abstract class EventDataRepository{
  getEventDataFromApi(String zipCode, String radius);
}

class EventDataRepositoryImpl implements EventDataRepository {
  Client http;
  EventDataRepositoryImpl([http]){
    this.http = http ?? Client();
  }

  @override
  getEventDataFromApi(String zipCode, String radius) async {
    String url = AppStrings.msrUrl + '?postalcode=' + zipCode + '&radius=' + radius;
    var response = await http.get(url, headers: Auth.headers);
    if (response.statusCode == 200) {
//      EventDataApiResultModel res = EventDataApiResultModel(response.body);
//      res.printNames();
//      res.printDates();
//      res.printTypes();
//      res.printDates();
      return 'yup';
    } else {
      print(response);
      throw Exception();
    }
  }
}