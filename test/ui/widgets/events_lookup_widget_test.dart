import 'package:auto_x/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main () {
  testWidgets('when event widget is built, there is a input for area code', (WidgetTester tester) async {
    await tester.pumpWidget(App());
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(RaisedButton, 'Events Lookup'));
    await tester.pumpAndSettle();

    final zipCodeInput = find.byType(CupertinoTextField);
    expect(zipCodeInput, findsOneWidget);
  });

  testWidgets('when event widget is built, there is a picker for search radius', (WidgetTester tester) async {
    await tester.pumpWidget(App());
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(RaisedButton, 'Events Lookup'));
    await tester.pumpAndSettle();

    final pickerFinder = find.byType(CupertinoPicker);
    expect(pickerFinder, findsOneWidget);
  });
}