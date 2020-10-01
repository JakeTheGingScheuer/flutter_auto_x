import 'manufacturer.dart';

class ApiResultModel {
  String status;
  int totalResults;
  List<Manufacturer> manufacturers;

  ApiResultModel({this.status, this.totalResults, this.manufacturers});

  ApiResultModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['manufacturers'] != null)
      manufacturers = new List<Manufacturer>();
      json['manufacturers'].forEach((entry) {
        manufacturers.add(new Manufacturer.fromJson(entry));
      });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['totalResults'] = this.totalResults;
    if (this.manufacturers != null) {
      data['manufacturers'] = this.manufacturers.map((entry)=> entry.toJson()).toList();
    }
    return data;
  }
}