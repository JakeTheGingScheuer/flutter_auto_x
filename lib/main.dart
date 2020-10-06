import 'package:auto_x/bloc/navigation/navigation_bloc.dart';
import 'package:auto_x/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: myTheme(),
        home: BlocProvider(create: (_) => NavigationBloc(), child: HomePage()));
  }
}

myTheme() {
  return ThemeData(primaryColor: Colors.white, accentColor: Colors.red, fontFamily: 'Ubuntu');
}
