import 'dart:convert';
import 'package:auto_x/data/model/car_data_api_result_model.dart';
import 'package:auto_x/data/model/car_data.dart';
import 'package:auto_x/res/strings/strings.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';


abstract class CarDataRepository {
  Future<List<Manufacturer>> getCarData();
  Future<List<Manufacturer>> getCarDataFromApi();
  Future<List<Manufacturer>> getCarDataFromLocalStorage();
}

class CarDataRepositoryImpl implements CarDataRepository {

  final LocalStorage deviceStorage = LocalStorage('device_storage');

  @override
  Future<List<Manufacturer>> getCarDataFromApi() async {
    var response = await http.get(AppStrings.carDataUrl);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      deviceStorage.setItem(AppStrings.localStorageDocument, data);
      List<Manufacturer> manufacturers = CarDataApiResultModel.fromJson(data).manufacturers;
      return manufacturers;
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<Manufacturer>> getCarDataFromLocalStorage() async{
    var storageReady = await deviceStorage.ready;
    if(storageReady) {
      var data = deviceStorage.getItem(AppStrings.localStorageDocument);
      List<Manufacturer> manufacturers = CarDataApiResultModel.fromJson(data).manufacturers;
      return manufacturers;
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<Manufacturer>> getCarData() async {
    try {
      return await getCarDataFromApi();
    } catch (e) {
      return await getCarDataFromLocalStorage();
    }
  }
}