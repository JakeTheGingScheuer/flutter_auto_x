import 'package:flutter/material.dart';
import 'car_data.dart';
import 'home_page_views.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<CarData> futureCarData;

  @override
  void initState(){
    super.initState();
    futureCarData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CarData>(
        future: futureCarData,
        builder: (context, snapshot) {
          print(snapshot);
          if (snapshot.connectionState == ConnectionState.done) {
            return homePageView(snapshot.data);
          } else {
            return loadingView();
          }
        });
  }
}