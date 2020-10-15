import 'package:auto_x/main.dart';
import 'package:auto_x/ui/pages/home_page.dart';
import 'package:auto_x/ui/widgets/navigation_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  testWidgets('when App is built, homepage is returned', (WidgetTester tester) async{
    await tester.pumpWidget(App());
    await tester.pumpAndSettle();

    final homepageWidgetFinder = find.byType(HomePage);
    expect(homepageWidgetFinder, findsOneWidget);
  });

  testWidgets('when homepage is built, a Navigation widget is returned', (WidgetTester tester) async{
    await tester.pumpWidget(App());
    await tester.pumpAndSettle();

    final navigationWidgetFinder = find.byType(NavigationWidget);
    expect(navigationWidgetFinder, findsOneWidget);
  });

  testWidgets('when homepage is built, a image is displayed', (WidgetTester tester) async{
    await tester.pumpWidget(App());
    await tester.pumpAndSettle();

    final imageFinder = find.byType(Image);
    expect(imageFinder, findsOneWidget);
  });

  testWidgets('when homepage is built, a homepage icon button is not displayed', (WidgetTester tester) async{
    await tester.pumpWidget(App());
    await tester.pumpAndSettle();

    final homeIconButtonFinder = find.byType(IconButton);
    expect(homeIconButtonFinder, findsNothing);
  });
}