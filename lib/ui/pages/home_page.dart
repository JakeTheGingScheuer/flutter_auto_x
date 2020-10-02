import 'package:auto_x/bloc/homepage/home_page_event.dart';
import 'package:auto_x/bloc/homepage/home_page_state.dart';
import 'package:auto_x/ui/widgets/manufacturer_selector_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/homepage/home_page_bloc.dart';

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
      appBar: AppBar(title: Text('SCCA AutoX Street Classes')),
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
                return ManufacturerSelectorWidget(manufacturers: state.manufacturers);
              } else {
                return Text("Nothing Happened");
              }
            }
          ),
        )
    );
  }
}