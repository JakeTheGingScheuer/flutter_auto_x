import 'package:auto_x/bloc/homepage/home_page_state.dart';
import 'package:auto_x/ui/widgets/manufacturer_selector_widget.dart';
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
              } else if (state is HomePageLoadingState) {
                return _buildLoading();
              } else if (state is HomePageErrorState) {
                return _buildFailed(state.message);
              } else if (state is HomePagedLoadedState) {
                return ManufacturerSelectorWidget(manufacturers: state.manufacturers);
              } else {
                return _buildFailed("Nothing Happened");
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

  _buildFailed(String message) {
    return Center(
      child: Text(message)
    );
  }
}