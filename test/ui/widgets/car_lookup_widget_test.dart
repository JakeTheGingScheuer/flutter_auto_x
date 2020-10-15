import 'package:auto_x/main.dart';
import 'package:auto_x/res/strings/strings.dart';
import 'package:auto_x/ui/pages/home_page.dart';
import 'package:auto_x/ui/widgets/car_class_result_widget.dart';
import 'package:auto_x/ui/widgets/home_page_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import '../../utils.dart';

MockHttp mockClient = MockHttp();
MockDeviceStorage mockStorage = MockDeviceStorage();

_navigateToCarLookupWidget(WidgetTester tester) async {
  when(mockClient.get(AppStrings.carDataUrl)).thenAnswer((_) async => Response(fakeResponseData, 200));
  when(mockStorage.setItem(AppStrings.localStorageDocument, fakeDecodedData)).thenAnswer((_) async => null);

  await tester.pumpWidget(App(mockClient, mockStorage));
  await tester.pumpAndSettle();

  final buttonFinder = find.widgetWithText(RaisedButton, 'Street Class Lookup');
  await tester.tap(buttonFinder);
  await tester.pumpAndSettle();
}

void main(){
  testWidgets('when carlookup widget is displayed, a homebutton is present', (WidgetTester tester) async {
    await _navigateToCarLookupWidget(tester);

    final homeButtonFinder = find.byType(HomePageButton);
    expect(homeButtonFinder, findsOneWidget);
  });

  testWidgets('when homebutton is pressed, homepage is displayed', (WidgetTester tester) async {
    await _navigateToCarLookupWidget(tester);

    final homeButtonFinder = find.byType(HomePageButton);
    await tester.tap(homeButtonFinder);
    await tester.pumpAndSettle();

    final homePageFinder = find.byType(HomePage);
    expect(homePageFinder, findsOneWidget);
  });

  testWidgets('when carlookup widget is displayed, a image is present', (WidgetTester tester) async {
    await _navigateToCarLookupWidget(tester);

    final imageFinder = find.byType(Image);
    expect(imageFinder, findsOneWidget);
  });

  testWidgets('when carlookup widget is displayed, a manufacturer picker is present', (WidgetTester tester) async {
    await _navigateToCarLookupWidget(tester);

    final pickerFinder = find.byKey(Key('manufacturerPicker'));
    expect(pickerFinder, findsOneWidget);
  });

  testWidgets('when carlookup widget is displayed, a floating action button is present', (WidgetTester tester) async {
    await _navigateToCarLookupWidget(tester);

    final actionButtonFinder = find.byType(FloatingActionButton);
    expect(actionButtonFinder, findsOneWidget);
  });

  testWidgets('when a manufacturer is selected, a model picker is present', (WidgetTester tester) async {
    await _navigateToCarLookupWidget(tester);
    await tester.tap(find.text('Subaru').first);
    await tester.pumpAndSettle();

    final actionButtonFinder = find.byType(FloatingActionButton);
    await tester.tap(actionButtonFinder);
    await tester.pumpAndSettle();

    final pickerFinder = find.byKey(Key('modelPicker'));
    expect(pickerFinder, findsOneWidget);
  });

  testWidgets('when model picker displayed, choices are from the manufacturer', (WidgetTester tester) async {
    await _navigateToCarLookupWidget(tester);
    await tester.tap(find.text('Subaru').first);
    await tester.pumpAndSettle();

    final actionButtonFinder = find.byType(FloatingActionButton);
    await tester.tap(actionButtonFinder);
    await tester.pumpAndSettle();

    final modelFinder = find.text('WRX');
    expect(modelFinder, findsWidgets);
  });

  testWidgets('when model picker displayed, an action button is displayed', (WidgetTester tester) async {
    await _navigateToCarLookupWidget(tester);
    await tester.tap(find.text('Subaru').first);
    await tester.pumpAndSettle();

    final actionButtonFinder = find.byType(FloatingActionButton);
    await tester.tap(actionButtonFinder);
    await tester.pumpAndSettle();

    final pickerFinder = find.byKey(Key('modelPicker'));
    expect(pickerFinder, findsOneWidget);

    final secondActionButtonFinder = find.byType(FloatingActionButton);
    expect(secondActionButtonFinder, findsOneWidget);
  });

  testWidgets('when model is selected, car class result widget displays result', (WidgetTester tester) async {
    await _navigateToCarLookupWidget(tester);
    await tester.tap(find.text('Subaru').first);
    await tester.pumpAndSettle();

    final actionButtonFinder = find.byType(FloatingActionButton);
    await tester.tap(actionButtonFinder);
    await tester.pumpAndSettle();

    await tester.tap(find.text('WRX').first);
    await tester.pumpAndSettle();

    final secondActionButtonFinder = find.byType(FloatingActionButton);
    await tester.tap(secondActionButtonFinder);
    await tester.pumpAndSettle();

    final carClassResultWidgetFinder = find.byType(CarClassResult);
    final resultFinder = find.text("D Street");
    expect(carClassResultWidgetFinder, findsOneWidget);
    expect(resultFinder, findsOneWidget);
  });
}