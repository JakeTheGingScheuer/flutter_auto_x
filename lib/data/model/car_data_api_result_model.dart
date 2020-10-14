import 'package:equatable/equatable.dart';

import 'car_data.dart';

class CarDataApiResultModel extends Equatable {
  List<Manufacturer> manufacturers;

  CarDataApiResultModel({this.manufacturers});

  CarDataApiResultModel.fromJson(Map<String, dynamic> json) {
      manufacturers = new List<Manufacturer>();
      json['manufacturers'].forEach((entry) {
        manufacturers.add(new Manufacturer.fromJson(entry));
      });
  }

  @override
  List<Object> get props => [manufacturers];
}