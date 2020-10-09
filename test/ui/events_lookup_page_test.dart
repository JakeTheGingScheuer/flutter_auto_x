import 'package:auto_x/main.dart';
import 'package:auto_x/ui/widgets/events_lookup_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main () {
  testWidgets('when event page is built, there is a events lookup widget', (WidgetTester tester) async {
    await tester.pumpWidget(App());
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(RaisedButton, 'Events Lookup'));
    await tester.pumpAndSettle();

    final widgetFinder = find.byType(EventsLookupWidget);
    expect(widgetFinder, findsOneWidget);
  });
}