import 'package:flutter/material.dart';

screenWidth(context){
  return MediaQuery.of(context).size.width;
}

screenHeight(context){
  return MediaQuery.of(context).size.height;
}

marginSpace(context){
  return SizedBox(
    width: MediaQuery.of(context).size.width*0.1,
    height: MediaQuery.of(context).size.height*0.1,
  );
}