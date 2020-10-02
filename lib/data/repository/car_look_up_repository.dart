abstract class CarLookUpRepository {
  String getManufacturer();
  String getCarModel();
  String getCarClass();
  void captureManufacturer(manufacturer);
  void captureCarModel(carModel);
  void captureCarClass(carClass);
}

class CarLookUpRepositoryImpl implements CarLookUpRepository{
  String carModel;
  String manufacturer;
  String carClass;

  @override
  String getCarModel() {
    return this.carModel;
  }

  @override
  String getManufacturer() {
    return this.manufacturer;
  }

  @override
  void captureCarModel(carModel) {
    this.carModel = carModel;
  }

  @override
  void captureManufacturer(manufacturer) {
    this.manufacturer = manufacturer;
  }

  @override
  void captureCarClass(carClass) {
    this.carClass = carClass;
  }

  @override
  String getCarClass() {
    return this.carClass;
  }
}