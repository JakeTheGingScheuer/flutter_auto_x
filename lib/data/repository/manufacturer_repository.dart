import 'dart:convert';
import 'package:auto_x/data/model/api_result_model.dart';
import 'package:auto_x/data/model/car.dart';
import 'package:auto_x/res/strings/strings.dart';
import 'package:http/http.dart' as http;


abstract class ManufacturerRepository {
  Future<List<Manufacturer>> getManufacturers();
}

class ManufacturerRepositoryImpl implements ManufacturerRepository {

  @override
  Future<List<Manufacturer>> getManufacturers() async {
    var response = await http.get(AppStrings.carDataUrl);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Manufacturer> manufacturers = ApiResultModel.fromJson(data).manufacturers;
      return manufacturers;
    } else {
      throw Exception();
    }
  }

}