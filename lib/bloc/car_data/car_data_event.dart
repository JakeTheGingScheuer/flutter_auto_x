import 'package:equatable/equatable.dart';

abstract class CarDataEvent extends Equatable {}

class FetchCarDataEvent extends CarDataEvent {
  @override
  List<Object> get props => null;
}