abstract class CarData {
  String name;
}

class Car extends CarData{
  String name;
  String carClass;

  Car.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if(name == 'Not Listed'){
      name = 'Any';
    }
    carClass = json['carClass'];
  }
}

class Manufacturer extends CarData{
  String name;
  List<Car> carModels;

  Manufacturer(){
    this.name = '';
    this.carModels= [];
  }

  Manufacturer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['carModels'] != null)
      carModels = new List<Car>();
    json['carModels'].forEach((entry) {
      carModels.add(new Car.fromJson(entry));
    });
  }
}