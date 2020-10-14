import './bloc/car_data_bloc_test.dart' as car_data_bloc_tests;
import './bloc/car_lookup_bloc_test.dart' as car_lookup_bloc_tests;
import './bloc/event_data_bloc_test.dart' as event_data_bloc_tests;
import './bloc/navigation_bloc_test.dart' as navigation_bloc_tests;

void main(){
  car_data_bloc_tests.main();
  car_lookup_bloc_tests.main();
  event_data_bloc_tests.main();
  navigation_bloc_tests.main();
}