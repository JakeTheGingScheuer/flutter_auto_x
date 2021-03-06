import 'package:auto_x/bloc/navigation/navigation_bloc.dart';
import 'package:auto_x/bloc/navigation/navigation_event.dart';
import 'package:auto_x/res/strings/strings.dart';
import 'package:auto_x/responsive.dart';
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
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: Responsive.XL,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: Responsive.XLSpace),
              Image(height: Responsive.largeLogo, image: AssetImage(AppStrings.sccaLogo)),
              SizedBox(height: Responsive.mediumSpace),
              RaisedButton(
                child: Text('Street Class Lookup', style: TextStyle(fontWeight: FontWeight.bold)),
                onPressed: () => navigationBloc.add(NavigateToCarLookupEvent()),
              ),
              RaisedButton(
                child: Text('Modification Allowances', style: TextStyle(fontWeight: FontWeight.bold)),
                onPressed: () => navigationBloc.add(NavigateToModsEvent()),
              ),
              RaisedButton(
                child: Text('Helmet Info', style: TextStyle(fontWeight: FontWeight.bold)),
                onPressed: () => navigationBloc.add(NavigateToHelmetsEvent()),
              ),
              RaisedButton(
                child: Text('Rule Book', style: TextStyle(fontWeight: FontWeight.bold)),
                onPressed: () => navigationBloc.add(NavigateToRuleBookEvent()),
              ),
              RaisedButton(
                child: Text('Events Lookup', style: TextStyle(fontWeight: FontWeight.bold)),
                onPressed: () => navigationBloc.add(NavigateToEventsEvent()),
              ), SizedBox(height:Responsive.mediumSpace)
            ],
          ),
        ),
      ),
    );
  }
}