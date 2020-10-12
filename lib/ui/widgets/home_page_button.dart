import 'package:auto_x/bloc/navigation/navigation_bloc.dart';
import 'package:auto_x/bloc/navigation/navigation_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: IconButton(
        icon: Icon(Icons.home),
        color: Colors.red,
        onPressed: () => BlocProvider.of<NavigationBloc>(context).add(NavigateHomeEvent()),
      ),
    );
  }
}