import 'package:auto_x/data/model/manufacturer.dart';
import 'package:flutter/material.dart';

class ManufacturerSelectorWidget extends StatelessWidget {

  final List<Manufacturer> manufacturers;

  ManufacturerSelectorWidget({@required this.manufacturers});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Select Make'),
        DropdownButton(
          key: Key('ManufacturerSelector'),
          items: _manufacturerList(),
          onChanged: (val) => print(val),
        )
      ],
    );
  }

  _manufacturerList() {
    List<String> makes = List<String>();
    manufacturers.forEach((make) {
      makes.add(make.name);
    });
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