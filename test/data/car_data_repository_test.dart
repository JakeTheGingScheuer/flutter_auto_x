import 'package:auto_x/data/repository/car_data_repository.dart';
import 'package:auto_x/res/strings/strings.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import '../utils.dart';

void main() {
  test('When onBootUp is true, getCarData calls getCarDataFromApi and returns List of manufacturers', () async{
    MockHttp mockClient = MockHttp();
    MockDeviceStorage mockStorage = MockDeviceStorage();

    CarDataRepositoryImpl carDataRepo = CarDataRepositoryImpl(mockClient, mockStorage);
    carDataRepo.onBootUp = true;
    when(mockClient.get(AppStrings.carDataUrl)).thenAnswer((_) async => Response(fakeResponseData, 200));
    when(mockStorage.setItem(AppStrings.localStorageDocument, fakeDecodedData)).thenAnswer((_) async => null);

    var actual = await carDataRepo.getCarData();
    verify(mockClient.get(AppStrings.carDataUrl));
    verify(mockStorage.setItem(AppStrings.localStorageDocument, fakeDecodedData));
    expect(actual, expectedData.manufacturers);
  });

  test('When onBootUp is false, getCarData calls getCarDataFromLocalStorage and returns List of manufacturers', () async{
    MockHttp mockClient = MockHttp();
    MockDeviceStorage mockStorage = MockDeviceStorage();

    CarDataRepositoryImpl carDataRepo = CarDataRepositoryImpl(mockClient, mockStorage);
    carDataRepo.onBootUp = false;

    when(mockStorage.ready).thenAnswer((_) async => true);
    when(mockStorage.getItem(AppStrings.localStorageDocument)).thenAnswer((_) => fakeDecodedData);

    var actual = await carDataRepo.getCarData();
    verifyNever(mockClient.get(AppStrings.carDataUrl));
    verifyNever(mockStorage.setItem(AppStrings.localStorageDocument, fakeDecodedData));
    verify(mockStorage.getItem(AppStrings.localStorageDocument));
    expect(actual, expectedData.manufacturers);
  });

  test('When onBootUp is true, and error when fetching data, getDataFromLocalStorage is called and returns List of manufacturers', () async{
    MockHttp mockClient = MockHttp();
    MockDeviceStorage mockStorage = MockDeviceStorage();

    CarDataRepositoryImpl carDataRepo = CarDataRepositoryImpl(mockClient, mockStorage);
    carDataRepo.onBootUp = true;

    when(mockClient.get(AppStrings.carDataUrl)).thenThrow(Exception());
    when(mockStorage.ready).thenAnswer((_) async => true);
    when(mockStorage.getItem(AppStrings.localStorageDocument)).thenAnswer((_) => fakeDecodedData);

    var actual = await carDataRepo.getCarData();
    verify(mockClient.get(AppStrings.carDataUrl));
    verifyNever(mockStorage.setItem(AppStrings.localStorageDocument, fakeDecodedData));
    verify(mockStorage.getItem(AppStrings.localStorageDocument));
    expect(actual, expectedData.manufacturers);
  });

  test('When onBootUp is true, and error when fetching data, and there is no local data, then exception is thrown', () async{
    MockHttp mockClient = MockHttp();
    MockDeviceStorage mockStorage = MockDeviceStorage();

    CarDataRepositoryImpl carDataRepo = CarDataRepositoryImpl(mockClient, mockStorage);
    carDataRepo.onBootUp = true;

    when(mockClient.get(AppStrings.carDataUrl)).thenThrow(Exception());
    when(mockStorage.ready).thenAnswer((_) async => true);
    when(mockStorage.getItem(AppStrings.localStorageDocument)).thenThrow(Exception());

    doesGetCarDataThrowException() async {
        try {
          await carDataRepo.getCarData();
          return false;
        } catch(e){return true;}}

    var actual = await doesGetCarDataThrowException();
    verify(mockClient.get(AppStrings.carDataUrl));
    verifyNever(mockStorage.setItem(AppStrings.localStorageDocument, fakeDecodedData));
    verify(mockStorage.getItem(AppStrings.localStorageDocument));
    expect(actual, true);
  });
}