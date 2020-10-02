import 'car.dart';

class Manufacturer {
  String name;
  List<Car> carModels;

  Manufacturer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['carModels'] != null)
      carModels = new List<Car>();
    json['carModels'].forEach((entry) {
      carModels.add(new Car.fromJson(entry));
    });
  }
}