import 'package:auto_x/data/repository/manufacturer_repository.dart';
import 'package:auto_x/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/homepage/home_page_bloc.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (_) => HomePageBloc(repository: ManufacturerRepositoryImpl()),
          child: HomePage()
      )
    );
  }
}