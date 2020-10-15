import 'ui/pages/home_page_test.dart' as home_page_tests;
import 'ui/widgets/navigation_widget_test.dart' as navigation_widget_tests;
import 'ui/pages/events_lookup_page_test.dart' as events_lookup_page_tests;
import 'ui/widgets/events_lookup_widget_test.dart' as events_lookup_widget_tests;
import 'ui/pages/car_lookup_page_test.dart' as car_lookup_page_tests;
import 'ui/widgets/car_lookup_widget_test.dart' as car_lookup_widget_tests;

void main(){
  home_page_tests.main();
  navigation_widget_tests.main();
  events_lookup_page_tests.main();
  events_lookup_widget_tests.main();
  car_lookup_page_tests.main();
  car_lookup_widget_tests.main();
}