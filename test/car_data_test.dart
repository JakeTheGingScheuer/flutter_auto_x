import 'package:auto_x/car_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;


Map<String, dynamic> fakeData =
{
  "Acura": {
    "Nsx": "SS",
    "Tsx": "DS"
  },
  "Toyota": {
    "Corolla": "HS",
    "Camry": "HS"
  }
};

class MockClient extends Mock implements http.Client {}

void main() {
  test('get manufacturers retuns a list of the keys from the data', (){
    CarData subject = CarData(fakeData);
    List<String> actual = subject.getManufacturers();
    List<String> expected = ['Acura', 'Toyota'];
    expect(actual, expected);
  });

  test('getModelsByManufacturer returns a list of models from a given manufacturer', (){
    CarData subject = CarData(fakeData);
    List<String> actual = subject.getModelsByManufacturer('Acura');
    List<String> expected = ['Nsx', 'Tsx'];
    expect(actual, expected);
  });

  test('getCarClass returns a class given a car model', (){
    CarData subject = CarData(fakeData);
    String actual = subject.getCarClass('Toyota', 'Corolla');
    String expected = 'HS';
    expect(actual, expected);
  });

  test('when fetchData gets a 200, it returns a carData object from response data', () async {
    final mockHttpClient = MockClient();
    when(mockHttpClient.get('http://127.0.0.1:5000/api/street_class/'))
        .thenAnswer((_) async => http.Response('{"Acura": {"NSX": "SS"}}', 200));

    CarData actual = await fetchData(mockHttpClient);
    CarData expected = CarData({"Acura": {"NSX": "SS"}});

    expect(actual, expected);
  });

  test('when fetchData gets a 400 it returns null', () async {
    final mockHttpClient = MockClient();
    when(mockHttpClient.get('http://127.0.0.1:5000/api/street_class/'))
        .thenAnswer((_) async => http.Response('{"Acura": {"NSX": "SS"}}', 400));

    CarData actual = await fetchData(mockHttpClient);
    expect(actual, null);
  });
}