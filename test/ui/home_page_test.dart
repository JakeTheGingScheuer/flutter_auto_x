import 'package:auto_x/main.dart';
import 'package:auto_x/ui/pages/home_page.dart';
import 'package:auto_x/ui/widgets/navigation_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;


void main(){
  testWidgets('when App is built, homepage is returned', (WidgetTester tester) async{
    await tester.pumpWidget(App());
    await tester.idle();
    await tester.pump(Duration.zero);

    final homepageWidgetFinder = find.byType(HomePage);
    expect(homepageWidgetFinder, findsOneWidget);
  });

  testWidgets('when homepage is built, a Navigation widget is returned', (WidgetTester tester) async{
    await tester.pumpWidget(App());
    await tester.idle();
    await tester.pump(Duration.zero);

    final navigationWidgetFinder = find.byType(NavigationWidget);
    expect(navigationWidgetFinder, findsOneWidget);
  });

  testWidgets('when navigation widget is built, 3 buttons are built', (WidgetTester tester) async{
    await tester.pumpWidget(App());
    await tester.idle();
    await tester.pump(Duration.zero);

    final streetClassButtonFinder = find.widgetWithText(RaisedButton, 'Street Class Lookup');
    final modsButtonFinder = find.widgetWithText(RaisedButton, 'Modification Allowances');
    final eventsButtonFinder = find.widgetWithText(RaisedButton, 'Events Lookup');

    expect(streetClassButtonFinder, findsOneWidget);
    expect(modsButtonFinder, findsOneWidget);
    expect(eventsButtonFinder, findsOneWidget);
  });

//  testWidgets('when fetchData returns 200, a dropdown is made with items from data', (WidgetTester tester) async{
//    final mockHttpClient = MockClient();
//    String fakeResponseBody = '{"Acura": {"NSX": "SS"}, "Toyota": {"Corolla": "HS"}}';
//    when(mockHttpClient.get('http://127.0.0.1:5000/api/street_class/'))
//        .thenAnswer((_) async => http.Response(fakeResponseBody, 200));
//
//    await tester.pumpWidget(App(mockHttpClient));
//    await tester.pumpAndSettle(Duration(seconds: 2));
//
//    final dropDownLabelFinder = find.text('Select Make');
//    final dropDownFinder = find.byKey(Key('ManufacturerSelector'));
//    expect(dropDownLabelFinder, findsOneWidget);
//    expect(dropDownFinder, findsOneWidget);
//
//    await tester.press(dropDownFinder);
//
//    final dropDownItem1 = find.text('Acura');
//    final dropDownItem2 = find.text('Toyota');
//    expect(dropDownItem1, findsOneWidget);
//    expect(dropDownItem2, findsOneWidget);
//  });
}