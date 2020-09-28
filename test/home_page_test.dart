import 'package:auto_x/api_client.dart';
import 'package:flutter/material.dart';
import 'package:auto_x/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock implements http.Client {}

void main() {
  group('Manufacturer Selection', ()
  {
    testWidgets('When App is built, text for select make is rendered', (WidgetTester tester) async {
      await tester.pumpWidget(App());
      expect(find.text('Select Make'), findsOneWidget);
    });

    testWidgets('When App is built, a dropdown for make is rendered', (WidgetTester tester) async {
      await tester.pumpWidget(App());
      expect(find.byKey(Key('MakeSelection')), findsOneWidget);
    });
  });

  group('Api Client', ()
  {
    test('When api gets anything but a 200 error, data will equal a error message', () async {
      final mockClient = MockClient();
      when(mockClient.get('http://127.0.0.1:5000/api/street_class/'))
          .thenAnswer((_) async => http.Response('{}', 400));
      ApiClient subject = ApiClient(mockClient);
      expect(await subject.fetchData(), 'Failed to connect to server');
    });

    test('When api gets a 200, data will be returned', () async {
      final client = MockClient();
      when(client.get('http://127.0.0.1:5000/api/street_class/')).thenAnswer((_) async => http.Response('{"title": "Test"}', 200));

      ApiClient subject = ApiClient(client);
      expect(await subject.fetchData(), {'title': 'Test'});
    });
  });

  group('Start up', ()
  {
    testWidgets('When the app starts it tries to hit the api', (WidgetTester tester) async {
      await tester.pumpWidget(App());

      expect(find.text('Select Make'), findsOneWidget);
    });
  });
}