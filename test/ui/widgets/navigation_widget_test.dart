import 'package:auto_x/main.dart';
import 'package:auto_x/res/strings/strings.dart';
import 'package:auto_x/ui/pages/car_look_up_page.dart';
import 'package:auto_x/ui/pages/events_lookup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import '../../utils.dart';

MockHttp mockClient = MockHttp();
MockDeviceStorage mockStorage = MockDeviceStorage();

void main(){
  testWidgets('when navigation widget is built, 5 buttons are built', (WidgetTester tester) async{
    await tester.pumpWidget(App(mockClient, mockStorage));
    await tester.pumpAndSettle();

    final streetClassButtonFinder = find.widgetWithText(RaisedButton, 'Street Class Lookup');
    final modsButtonFinder = find.widgetWithText(RaisedButton, 'Modification Allowances');
    final eventsButtonFinder = find.widgetWithText(RaisedButton, 'Events Lookup');
    final helmetButtonFinder = find.widgetWithText(RaisedButton, 'Helmet Info');
    final ruleBookButtonFinder = find.widgetWithText(RaisedButton, 'Rule Book');

    expect(streetClassButtonFinder, findsOneWidget);
    expect(modsButtonFinder, findsOneWidget);
    expect(eventsButtonFinder, findsOneWidget);
    expect(helmetButtonFinder, findsOneWidget);
    expect(ruleBookButtonFinder, findsOneWidget);
  });

  testWidgets('when street class button is pressed, car lookup page is loaded', (WidgetTester tester) async{
    when(mockClient.get(AppStrings.carDataUrl)).thenAnswer((_) async => Response(fakeResponseData, 200));
    when(mockStorage.setItem(AppStrings.localStorageDocument, fakeDecodedData)).thenAnswer((_) async => null);

    await tester.pumpWidget(App(mockClient, mockStorage));
    await tester.pumpAndSettle();

    final streetClassButtonFinder = find.widgetWithText(RaisedButton, 'Street Class Lookup');
    await tester.tap(streetClassButtonFinder);
    await tester.pumpAndSettle();

    final carLookupPageFinder = find.byType(CarLookupPage);
    expect(carLookupPageFinder, findsOneWidget);
  });

  testWidgets('when events button is pressed, events page is loaded', (WidgetTester tester) async{
    await tester.pumpWidget(App(mockClient, mockStorage));
    await tester.pumpAndSettle();

    final eventsLookupButtonFinder = find.widgetWithText(RaisedButton, 'Events Lookup');
    await tester.tap(eventsLookupButtonFinder);
    await tester.pumpAndSettle();

    final eventsLookupPageFinder = find.byType(EventsLookupPage);
    expect(eventsLookupPageFinder, findsOneWidget);
  });

  testWidgets('when mods button is pressed, a pdf page is loaded', (WidgetTester tester) async{
    await tester.pumpWidget(App(mockClient, mockStorage));
    await tester.pumpAndSettle();

    final modsButtonFinder = find.widgetWithText(RaisedButton, 'Modification Allowances');
    await tester.tap(modsButtonFinder);
    await tester.pump(Duration(seconds: 2));

    final modsPageFinder = find.byKey(Key('modsPage'));
    expect(modsPageFinder, findsOneWidget);
  });

  testWidgets('when helmet button is pressed, a pdf page is loaded', (WidgetTester tester) async{
    await tester.pumpWidget(App(mockClient, mockStorage));
    await tester.pumpAndSettle();

    final modsButtonFinder = find.widgetWithText(RaisedButton, 'Helmet Info');
    await tester.tap(modsButtonFinder);
    await tester.pump(Duration(seconds: 2));

    final modsPageFinder = find.byKey(Key('helmetInfo'));
    expect(modsPageFinder, findsOneWidget);
  });

  testWidgets('when rulebook button is pressed, a pdf page is loaded', (WidgetTester tester) async{
    await tester.pumpWidget(App(mockClient, mockStorage));
    await tester.pumpAndSettle();

    final modsButtonFinder = find.widgetWithText(RaisedButton, 'Rule Book');
    await tester.tap(modsButtonFinder);
    await tester.pump(Duration(seconds: 2));

    final modsPageFinder = find.byKey(Key('ruleBook'));
    expect(modsPageFinder, findsOneWidget);
  });
}