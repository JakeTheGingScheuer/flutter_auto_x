import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:equatable/equatable.dart';

Future<CarData> fetchData(http.Client httpClient) async {
  var res = await httpClient.get('http://127.0.0.1:5000/api/street_class/');
  if(res.statusCode == 200){
    return CarData(json.decode(res.body));
  }
}

class CarData extends Equatable{
  Map<String, dynamic> data;

  CarData(this.data);

  @override
  List<Object> get props => [data];

  List<String> getManufacturers(){
    return this.data.keys.toList();
  }

  List<String> getModelsByManufacturer(String manufacturer){
    return this.data[manufacturer].keys.toList();
  }

  String getCarClass(String manufacturer, String model){
    return this.data[manufacturer][model];
  }
}