import 'dart:convert';
import 'package:auto_x/data/model/car_data.dart';
import 'package:auto_x/data/model/car_data_api_result_model.dart';
import 'package:http/http.dart';
import 'package:localstorage/localstorage.dart';
import 'package:mockito/mockito.dart';

class MockHttp extends Mock implements Client{}
class MockDeviceStorage extends Mock implements LocalStorage{}

String fakeResponseData = '{''"manufacturers": [{"name": "Subaru", "carModels": [{"name": "WRX", "carClass": "D Street"}]},{"name": "Toyota","carModels": [{"name": "Corolla", "carClass": "H Street"}]}]}';

Map<String, dynamic> fakeDecodedData = json.decode(fakeResponseData);
Car fakeCar1 = Car(name: 'WRX', carClass: 'D Street');
Car fakeCar2 = Car(name: 'Corolla', carClass: 'H Street');
Manufacturer fakeManufacturer1 = Manufacturer(name: 'Subaru', carModels: [fakeCar1]);
Manufacturer fakeManufacturer2 = Manufacturer(name: 'Toyota', carModels: [fakeCar2]);
CarDataApiResultModel expectedData = CarDataApiResultModel(manufacturers: [fakeManufacturer1, fakeManufacturer2]);