import 'dart:convert';
import 'package:auto_x/data/model/car_data_api_result_model.dart';
import 'package:auto_x/data/model/car_data.dart';
import 'package:auto_x/res/strings/strings.dart';
import 'package:http/http.dart' as http;


abstract class CarDataRepository {
  Future<List<Manufacturer>> getCarData();
}

class CarDataRepositoryImpl implements CarDataRepository {

  @override
  Future<List<Manufacturer>> getCarData() async {
    var response = await http.get(AppStrings.carDataUrl);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Manufacturer> manufacturers = CarDataApiResultModel.fromJson(data).manufacturers;
      return manufacturers;
    } else {
      throw Exception();
    }
  }

}