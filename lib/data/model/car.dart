class Car {
  String name;
  String carClass;

  Car.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    carClass = json['carClass'];
  }
}