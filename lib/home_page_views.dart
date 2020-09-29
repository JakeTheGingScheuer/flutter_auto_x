import 'package:flutter/material.dart';
import 'car_data.dart';

loadingView() {
  return Scaffold(
      body: Center(
          child: CircularProgressIndicator()
      )
  );
}

homePageView(CarData data) {
  if(data != null){
    return manufacturerSelectionView(data);
  } else {
    return connectionFailedView();
  }
}

connectionFailedView(){
  return Scaffold(
      body: Center(
          child: Text('Connection to server failed...')
      )
  );
}

manufacturerSelectionView(CarData data) {
  return Scaffold(
      appBar: AppBar(
        title: Text('SCCA AutoX Street Class Guide'),
      ),
      body: Center(
          child: Column(
            children: <Widget>[
              Text('Select Make'),
              DropdownButton(
                key: Key('ManufacturerSelector'),
                items: manufacturerList(data.getManufacturers()),
                onChanged: (val) => print(val),
              )
            ],
          )
      )
  );
}

manufacturerList(List<String> makes) {
  return makes.map<DropdownMenuItem<String>>((String value) {
    return manufacturerItem(value);
  }).toList();
}

manufacturerItem(String value) {
  return DropdownMenuItem<String>(
    value: value,
    child: Text(value),
  );
}