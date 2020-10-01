import 'package:flutter/material.dart';

class ManufacturerSelectorWidget extends StatelessWidget {
  const ManufacturerSelectorWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Select Make'),
        DropdownButton(
          key: Key('ManufacturerSelector'),
          items: _manufacturerList(['list', 'from', 'bloc', 'provider']),
          onChanged: (val) => print(val),
        )
      ],
    );
  }

  _manufacturerList(List<String> makes) {
    return makes.map<DropdownMenuItem<String>>((String value) {
      return _manufacturerItem(value);
    }).toList();
  }

  _manufacturerItem(String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }
}