//import 'package:auto_x/main.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter_test/flutter_test.dart';
//import 'package:mockito/mockito.dart';
//import 'mock_http_client.dart';
//import 'package:http/http.dart' as http;
//
//
//void main(){
//  testWidgets('when fetchData returns 400, a connection error is displayed', (WidgetTester tester) async{
//    final mockHttpClient = MockClient();
//    when(mockHttpClient.get('http://127.0.0.1:5000/api/street_class/'))
//        .thenAnswer((_) async => http.Response('{"Acura": {"NSX": "SS"}}', 400));
//
//    await tester.pumpWidget(App(mockHttpClient));
//    await tester.pumpAndSettle(Duration(seconds: 2));
//
//    final failedConnectionMessageFinder = find.text('Connection to server failed...');
//    expect(failedConnectionMessageFinder, findsOneWidget);
//  });
//
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
//}