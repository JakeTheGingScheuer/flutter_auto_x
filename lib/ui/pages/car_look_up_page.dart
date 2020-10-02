import 'package:auto_x/bloc/car_look_up/car_look_up_bloc.dart';
import 'package:auto_x/bloc/car_look_up/car_look_up_event.dart';
import 'package:auto_x/bloc/car_look_up/car_look_up_state.dart';
import 'package:auto_x/data/model/car.dart';
import 'package:auto_x/data/model/manufacturer.dart';
import 'package:auto_x/ui/widgets/car_model_selector_widget.dart';
import 'package:auto_x/ui/widgets/manufacturer_selector_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarLookUpPage extends StatefulWidget {
  final List<Manufacturer> manufacturers;
  CarLookUpPage({@required this.manufacturers});

  @override
  _CarLookUpState createState() => _CarLookUpState(manufacturers: this.manufacturers);
}

class _CarLookUpState extends State<CarLookUpPage> {
  CarLookUpBloc carLookUpBloc;
  final List<Manufacturer> manufacturers;

  _CarLookUpState({@required this.manufacturers});

  @override
  void initState(){
    super.initState();
    carLookUpBloc = BlocProvider.of<CarLookUpBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<CarLookUpBloc, CarLookUpState>(
        builder:(context, state){
          if (state is CarLookUpInitialState) {
            return ManufacturerSelectorWidget(manufacturers: manufacturers);
          }
          else if (state is CarLookUpSelectedManufacturerState){
            List<Car> cars = _getCarsByManufacturer(carLookUpBloc.repository.getManufacturer());
            return CarModelSelectorWidget(carModels: cars);
          }
          else if (state is CarLookUpSelectedModelState){
            return GestureDetector(
              onTap: () => carLookUpBloc.add(ResetEvent()),
                child: Text('${state.model} is in ${state.carClass}'
                ));
          }
          else {
            return Text('did not work');
          }
        }
      ),
    );
  }
  
  _getCarsByManufacturer(String manufacturerSelected){
    List<Car> cars = [];
    for (Manufacturer manufacturer in manufacturers){
      if (manufacturer.name == manufacturerSelected){
        cars = manufacturer.carModels;
      }
    }
    return cars;
  }
}