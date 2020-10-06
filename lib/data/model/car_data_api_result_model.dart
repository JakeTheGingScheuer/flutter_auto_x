import 'car_data.dart';

class CarDataApiResultModel {
  List<Manufacturer> manufacturers;

  CarDataApiResultModel({this.manufacturers});

  CarDataApiResultModel.fromJson(Map<String, dynamic> json) {

    if (json['manufacturers'] != null)
      manufacturers = new List<Manufacturer>();
      json['manufacturers'].forEach((entry) {
        manufacturers.add(new Manufacturer.fromJson(entry));
      });
  }
}