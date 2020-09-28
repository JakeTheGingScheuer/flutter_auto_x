import 'dart:convert';
import 'package:http/http.dart' as http;

Future<CarData> fetchData() async {
  var res = await http.get('http://127.0.0.1:5000/api/street_class/');
  if(res.statusCode == 200){
    return CarData(json.decode(res.body));
  }
}

class CarData {
  Map<String, dynamic> data;

  CarData(this.data);

  getManufacturers(){
    return this.data.keys.toList();
  }

  getCarsByManufacturer(String manufacturer){
    return this.data[manufacturer];
  }

  getCarClass(String manufacturer, String model){
    return this.data[manufacturer][model];
  }
}