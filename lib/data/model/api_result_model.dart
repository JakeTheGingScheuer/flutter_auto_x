import 'manufacturer.dart';

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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.manufacturers != null) {
      data['manufacturers'] = this.manufacturers.map((entry)=> entry.toJson()).toList();
    }
    return data;
  }
}