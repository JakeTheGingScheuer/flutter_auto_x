import 'package:auto_x/bloc/homepage/home_page_state.dart';
import 'package:auto_x/data/model/manufacturer.dart';
import 'package:auto_x/data/repository/manufacturer_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'home_page_event.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  ManufacturerRepository repository;

  HomePageBloc({@required this.repository});

  @override
  HomePageState get initialState => HomePageInitialState();

  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async* {
    if (event is FetchCarDataEvent){
      yield HomePageLoadingState();
      try {
        List<Manufacturer> manufacturers = await repository.getManufacturers();
        yield HomePagedLoadedState(manufacturers: manufacturers);
      } catch (e) {
        yield HomePageErrorState(message: e.toString());
      }
    }
  }

}