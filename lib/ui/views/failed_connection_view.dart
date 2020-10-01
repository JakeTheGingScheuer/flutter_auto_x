import 'package:flutter/material.dart';

class FailedConnectionView extends StatelessWidget {
  const FailedConnectionView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Text('Connection to server failed...')
        )
    );
  }
}