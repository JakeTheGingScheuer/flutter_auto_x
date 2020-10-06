import 'package:auto_x/data/model/car_data.dart';

abstract class CarLookUpRepository {
  void captureManufacturer(manufacturer);
  void captureCarModel(carModel);
}

class CarLookUpRepositoryImpl implements CarLookUpRepository{
  Car carModel;
  Manufacturer manufacturer;

  @override
  void captureCarModel(carModel) {
    this.carModel = carModel;
  }

  @override
  void captureManufacturer(manufacturer) {
    this.manufacturer = manufacturer;
  }
}