import 'car.dart';

class Manufacturer {
  String name;
  List<Car> carModels;

  Manufacturer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['manufacturers'] != null)
      carModels = new List<Car>();
    json['manufacturers'].forEach((entry) {
      carModels.add(new Car.fromJson(entry));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.carModels != null) {
      data['manufacturers'] = this.carModels.map((entry)=> entry.toJson()).toList();
    }
    return data;
  }
}