
import 'package:doodle_blur_task/app/features/business/data/models/business_response_model.dart';
import 'package:equatable/equatable.dart';

class BusinessEntity extends Equatable {
  List<Business> businesses;
  int total;
  Region region;

  BusinessEntity({required this.businesses, required this.total, required this.region});

  @override
  List<Object?> get props => [businesses, total, region];
}