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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.carModels != null) {
      data['carModels'] = this.carModels.map((entry)=> entry.toJson()).toList();
    }
    return data;
  }
}