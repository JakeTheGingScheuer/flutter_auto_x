import 'package:auto_x/bloc/homepage/home_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/homepage/home_page_bloc.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: BlocBuilder<HomePageBloc, HomePageState>(
            builder:(context, state){
              if (state is HomePageInitialState){
                return _buildLoading();
              } else {
                return _buildLoading();
              }
            }
          ),
        )
    );
  }

  _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}