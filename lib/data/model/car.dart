class Car {
  String name;
  String carClass;

  Car.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    carClass = json['carClass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['carClass'] = this.carClass;
    return data;
  }
}