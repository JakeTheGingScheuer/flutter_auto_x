import 'package:flutter/material.dart';
import 'car_data.dart';
import 'home_page_views.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  http.Client httpClient;

  HomePage(this.httpClient);


  @override
  _HomePageState createState() => _HomePageState(this.httpClient);
}

class _HomePageState extends State<HomePage> {
  Future<CarData> futureCarData;
  http.Client httpClient;

  _HomePageState(this.httpClient);

  @override
  void initState(){
    super.initState();
    futureCarData = fetchData(this.httpClient);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CarData>(
        future: futureCarData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return homePageView(snapshot.data);
          } else {
            return loadingView();
          }
        });
  }
}