import 'package:equatable/equatable.dart';

abstract class CarData {
  String name;
}

class Car extends Equatable implements CarData{
  String name;
  String carClass;

  Car({this.name, this.carClass});

  Car.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if(name == 'Not Listed'){
      name = 'Any';
    }
    carClass = json['carClass'];
  }

  @override
  List<Object> get props => [name, carClass];
}

class Manufacturer extends Equatable implements CarData{
  String name;
  List<Car> carModels;

  Manufacturer({this.name, this.carModels});

  Manufacturer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    carModels = new List<Car>();
    json['carModels'].forEach((entry) {
      carModels.add(new Car.fromJson(entry));
    });
  }

  @override
  List<Object> get props => [name, carModels];
}