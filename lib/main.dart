import 'package:auto_x/data/repository/car_data_repository.dart';
import 'package:auto_x/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/car_data/car_data_bloc.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme(),
      home: BlocProvider(
          create: (_) => CarDataBloc(repository: CarDataRepositoryImpl()),
          child: HomePage()
      )
    );
  }
}

myTheme(){
  return ThemeData(
    primaryColor: Colors.white,
    accentColor: Colors.red,
    fontFamily: 'Ubuntu'
  );
}