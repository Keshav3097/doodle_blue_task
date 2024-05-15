
import 'package:doodle_blur_task/model/business_response_model.dart';

class BusinessState {}

class InitialState extends BusinessState {}
class LoadingState extends BusinessState {}
class LoadedState extends BusinessState {
  final List<BusinessResponseModel> data;
  LoadedState({required this.data});
}

class ErrorState extends BusinessState {
  final String msg;
  ErrorState({required this.msg});
}