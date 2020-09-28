import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<CarData> fetchData() async {
  var res = await http.get('http://127.0.0.1:5000/api/street_class/');
  if(res.statusCode == 200){
    return CarData(json.decode(res.body));
  }
  else{
    return CarData({'0': {'0': 'Failed to connect to server'}});
  }
}

class CarData {
  Map<String, dynamic> data;

  CarData(this.data);

  getMakes(){
    return this.data.keys.toList();
  }
}

void main() => runApp(App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

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
          if (snapshot.hasData) {
            return selectionScreen(snapshot.data);
          } else {
            return loadScreen();
          }
        });
  }

  selectionScreen(CarData data) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SCCA AutoX Street Class Guide'),
        ),
        body: Center(
            child: Column(
              children: <Widget>[
                Text('Select Make'),
                DropdownButton(
                  key: Key('MakeSelection'),
                  items: makeDropDownChoices(data.getMakes()),
                  onChanged: (val) => print(val),
                )
              ],
            )
        )
    );
  }

  List<DropdownMenuItem<String>> makeDropDownChoices(List<String> makes) {
    return makes.map<DropdownMenuItem<String>>((
        String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }

  loadScreen() {
    return Scaffold(
        body: Center(
            child: CircularProgressIndicator()
        )
    );
  }
}