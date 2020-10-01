import 'package:auto_x/data/model/car_data.dart';
import 'package:bloc/bloc.dart';
import 'home_page_event.dart';

class HomePageBloc extends Bloc<HomePageEvent, CarData> {
  final CarData carData;

  HomePageBloc({CarData carData}): carData = carData ?? new CarData({});

  void onLoading(){
    add(LoadingEvent());
  }

  @override
  CarData get initialState => CarData({});

  @override
  Stream<CarData> mapEventToState(HomePageEvent event) async* {
    if (event is LoadingEvent) {
      yield carData;
    }
  }
}