import 'package:auto_x/data/model/car_data.dart';
import 'package:auto_x/data/model/car_data_api_result_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test('Car from json returns a car data object from json', (){
    Map<String, dynamic> fakeJson = {
      'name': 'WRX',
      'carClass': 'D Street'
    };

    Car actual = Car.fromJson(fakeJson);
    Car expected = Car(name: 'WRX', carClass: 'D Street');
    expect(actual, expected);
  });

  test('Car from json returns a car name as any if name is not listed in json', (){
    Map<String, dynamic> fakeJson = {
      'name': 'Not Listed',
      'carClass': 'D Street'
    };

    Car actual = Car.fromJson(fakeJson);
    Car expected = Car(name: 'Any', carClass: 'D Street');
    expect(actual, expected);
  });

  test('Manufacturer from json returns a manufacturer data object from json', (){
    Map<String, dynamic> fakeJson = {
      'name': 'Subaru',
      'carModels': [
        {'name': 'WRX', 'carClass': 'D Street'},
        {'name': 'BRZ', 'carClass': 'D Street'}
      ]
    };
    Car fakeCar1 = Car(name: 'WRX', carClass: 'D Street');
    Car fakeCar2 = Car(name: 'BRZ', carClass: 'D Street');

    Manufacturer actual = Manufacturer.fromJson(fakeJson);
    Manufacturer expected = Manufacturer(name: 'Subaru', carModels: [fakeCar1, fakeCar2]);
    expect(actual, expected);
  });

  test('Car data api result from json returns a manufacturer data object from json', (){
    Map<String, dynamic> fakeJson = {
      'manufacturers': [
        {
          'name': 'Subaru',
          'carModels': [
            {'name': 'WRX', 'carClass': 'D Street'},
          ]
        },
        {'name': 'Toyota',
          'carModels': [
            {'name': 'Corolla', 'carClass': 'H Street'}
          ]
        }
      ]
    };
    Car fakeCar1 = Car(name: 'WRX', carClass: 'D Street');
    Car fakeCar2 = Car(name: 'Corolla', carClass: 'H Street');
    Manufacturer fakeManufacturer1 = Manufacturer(name: 'Subaru', carModels: [fakeCar1]);
    Manufacturer fakeManufacturer2 = Manufacturer(name: 'Toyota', carModels: [fakeCar2]);
    CarDataApiResultModel expected = CarDataApiResultModel(manufacturers: [fakeManufacturer1, fakeManufacturer2]);

    CarDataApiResultModel actual = CarDataApiResultModel.fromJson(fakeJson);
    expect(actual, expected);
  });
}