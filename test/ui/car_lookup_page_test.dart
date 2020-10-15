import 'package:auto_x/main.dart';
import 'package:auto_x/res/strings/strings.dart';
import 'package:auto_x/ui/widgets/car_look_up_widget.dart';
import 'package:auto_x/ui/widgets/spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import '../utils.dart';

MockHttp mockClient = MockHttp();
MockDeviceStorage mockStorage = MockDeviceStorage();

void main() {
  testWidgets('when car lookup page is loading, a spinner is displayed', (WidgetTester tester) async {
    when(mockClient.get(AppStrings.carDataUrl)).thenAnswer((_) async => Response(fakeResponseData, 200));
    when(mockStorage.setItem(AppStrings.localStorageDocument, fakeDecodedData)).thenAnswer((_) async => null);

    await tester.pumpWidget(App(mockClient, mockStorage));
    await tester.pumpAndSettle();

    final buttonFinder = find.widgetWithText(RaisedButton, 'Street Class Lookup');
    await tester.tap(buttonFinder);
    await tester.pump();

    final spinnerFinder = find.byType(Spinner);
    expect(spinnerFinder, findsOneWidget);
  });

  testWidgets('when car lookup page has loaded, a carLookupWidget is displayed', (WidgetTester tester) async {
    when(mockClient.get(AppStrings.carDataUrl)).thenAnswer((_) async => Response(fakeResponseData, 200));
    when(mockStorage.setItem(AppStrings.localStorageDocument, fakeDecodedData)).thenAnswer((_) async => null);

    await tester.pumpWidget(App(mockClient, mockStorage));
    await tester.pumpAndSettle();

    final buttonFinder = find.widgetWithText(RaisedButton, 'Street Class Lookup');
    await tester.tap(buttonFinder);
    await tester.pumpAndSettle();

    final carLookupWidgetFinder = find.byType(CarLookupWidget);
    expect(carLookupWidgetFinder, findsOneWidget);
  });

  testWidgets('when car lookup page has loaded and there was an error getting data, the error message is displayed', (WidgetTester tester) async {
    when(mockClient.get(AppStrings.carDataUrl)).thenThrow(Exception());
    when(mockStorage.ready).thenAnswer((_) async => true);
    when(mockStorage.getItem(AppStrings.localStorageDocument)).thenThrow(Exception("error"));

    await tester.pumpWidget(App(mockClient, mockStorage));
    await tester.pumpAndSettle();

    final buttonFinder = find.widgetWithText(RaisedButton, 'Street Class Lookup');
    await tester.tap(buttonFinder);
    await tester.pumpAndSettle();

    final carLookupWidgetFinder = find.text("Exception: error");
    expect(carLookupWidgetFinder, findsOneWidget);
  });
}