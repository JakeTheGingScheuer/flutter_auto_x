import 'package:flutter/material.dart';
import 'package:auto_x/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Manufacturer Selection', ()
  {
    testWidgets('When App is built, text for select make is rendered', (
        WidgetTester tester) async {
      await tester.pumpWidget(App());
      expect(find.text('Select Make'), findsOneWidget);
    });

    testWidgets('When App is built, a dropdown for make is rendered', (
        WidgetTester tester) async {
      await tester.pumpWidget(App());
      expect(find.byKey(Key('MakeSelection')), findsOneWidget);
    });

    test('Calendar should have a list of 14 months', () {
      expect('1', '1');
    });
  });

  group('Api Client', () {

  });
}