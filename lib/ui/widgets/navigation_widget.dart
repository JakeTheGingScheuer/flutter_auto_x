import 'package:auto_x/bloc/navigation/navigation_bloc.dart';
import 'package:auto_x/bloc/navigation/navigation_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationWidget extends StatefulWidget{
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<NavigationWidget> {
  NavigationBloc navigationBloc;

  @override
  void initState(){
    super.initState();
    navigationBloc = BlocProvider.of<NavigationBloc>(context);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image(height: 200, image: AssetImage('assets/scca-logo.jpg')),
          SizedBox(height: 20),
          RaisedButton(
            child: Text('Street Class Lookup'),
            onPressed: () => navigationBloc.add(NavigateToCarLookupEvent()),
          ),
          RaisedButton(
            child: Text('Modification Allowances'),
            onPressed: () => navigationBloc.add(NavigateToModsEvent()),
          ),
          RaisedButton(
            child: Text('Events Lookup'),
            onPressed: () => navigationBloc.add(NavigateToEventsEvent()),
          ), SizedBox(height:120)
        ],
      ),
    );
  }
}