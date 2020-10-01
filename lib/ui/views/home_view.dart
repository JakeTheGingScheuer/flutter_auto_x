import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/car_data.dart';
import '../../bloc/homepage/home_page_bloc.dart';

class HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<HomePageBloc, CarData>(
          builder:(_, data){
            return Center(
                child: CircularProgressIndicator()
            );
          }
        )
    );
  }
}