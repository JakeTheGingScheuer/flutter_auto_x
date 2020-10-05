import 'car.dart';

class ApiResultModel {
  List<Manufacturer> manufacturers;

  ApiResultModel({this.manufacturers});

  ApiResultModel.fromJson(Map<String, dynamic> json) {

    if (json['manufacturers'] != null)
      manufacturers = new List<Manufacturer>();
      json['manufacturers'].forEach((entry) {
        manufacturers.add(new Manufacturer.fromJson(entry));
      });
  }
}