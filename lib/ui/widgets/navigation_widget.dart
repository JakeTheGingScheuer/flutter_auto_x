import 'package:auto_x/bloc/navigation/navigation_bloc.dart';
import 'package:auto_x/bloc/navigation/navigation_event.dart';
import 'package:auto_x/res/strings/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationWidget extends StatefulWidget{
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<NavigationWidget> {
  NavigationBloc navigationBloc;
  var hFlexVal;
  var wFlexVal;

  @override
  void initState(){
    super.initState();
    navigationBloc = BlocProvider.of<NavigationBloc>(context);
  }
  @override
  Widget build(BuildContext context) {
    hFlexVal = MediaQuery.of(context).size.height*0.05;
    wFlexVal = MediaQuery.of(context).size.width*0.1;
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: 7*wFlexVal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 2*hFlexVal),
              Image(height: 6*hFlexVal, image: AssetImage(AppStrings.sccaLogo)),
              SizedBox(height: 0.5*hFlexVal),
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
              ), SizedBox(height:3*hFlexVal)
            ],
          ),
        ),
      ),
    );
  }
}