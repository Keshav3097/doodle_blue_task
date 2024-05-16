
import 'package:doodle_blur_task/app/features/business/domain/entity/business_entity.dart';

class BusinessState {}

class InitialState extends BusinessState {}
class LoadingState extends BusinessState {}
class LoadedState extends BusinessState {
  final BusinessEntity data;
  LoadedState({required this.data});
}

class ErrorState extends BusinessState {
  final String msg;
  ErrorState({required this.msg});
}