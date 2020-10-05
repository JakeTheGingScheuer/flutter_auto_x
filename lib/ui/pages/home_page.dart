import 'package:auto_x/bloc/car_look_up/car_look_up_bloc.dart';
import 'package:auto_x/bloc/homepage/home_page_event.dart';
import 'package:auto_x/bloc/homepage/home_page_state.dart';
import 'package:auto_x/data/repository/car_look_up_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/homepage/home_page_bloc.dart';
import 'car_look_up_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageBloc homePageBloc;

  @override
  void initState() {
    super.initState();
    homePageBloc = BlocProvider.of<HomePageBloc>(context);
    homePageBloc.add(FetchCarDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: true,
        appBar: AppBar(title: Text('Street Class Lookup')),
          body: Center(
            child: BlocBuilder<HomePageBloc, HomePageState>(
              builder:(context, state){
                if (state is HomePageInitialState){
                  return CircularProgressIndicator();
                } else if (state is HomePageLoadingState) {
                  return CircularProgressIndicator();
                } else if (state is HomePageErrorState) {
                  return Text(state.message);
                } else if (state is HomePageLoadedState) {
                  return BlocProvider(
                      create: (_) => CarLookUpBloc(repository: CarLookUpRepositoryImpl()),
                      child: CarLookUpPage(manufacturers: state.manufacturers)
                  );
                } else {
                  return Text("Nothing Happened");
                }
              }
            ),
          )
      );
  }
}