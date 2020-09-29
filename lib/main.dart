import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'home_page.dart';

void main() => runApp(App(http.Client()));

class App extends StatelessWidget {
  http.Client httpClient;

  App(this.httpClient);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(this.httpClient),
    );
  }
}