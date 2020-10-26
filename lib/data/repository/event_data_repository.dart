import 'dart:convert';
import 'package:auto_x/res/auth.dart';
import 'package:auto_x/res/strings/strings.dart';
import 'package:http/http.dart';
import 'package:xml2json/xml2json.dart';

abstract class EventDataRepository{
  getEventDataFromApi(String zipCode, String radius);
}

class EventDataRepositoryImpl implements EventDataRepository {
  Client http;
  final myTransformer = Xml2Json();

  EventDataRepositoryImpl([http]){
    this.http = http ?? Client();
  }

  @override
  getEventDataFromApi(String zipCode, String radius) async {
    String url = AppStrings.msrUrl + '?postalcode=' + zipCode + '&radius=' + radius;
    var response = await http.get(url, headers: Auth.headers);
    if (response.statusCode == 200) {
      myTransformer.parse(response.body);
      print("----------------------");
      print(myTransformer.toParker());
      print("----------------------");
    } else {
      print(response);
      throw Exception();
    }
  }
}