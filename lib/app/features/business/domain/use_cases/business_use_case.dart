
import 'package:dartz/dartz.dart';
import 'package:doodle_blur_task/app/core/http_helper/errors/failure.dart';
import 'package:doodle_blur_task/app/core/models/use_case_request_model.dart';
import 'package:doodle_blur_task/app/core/use_cases/use_case.dart';
import 'package:doodle_blur_task/app/features/business/domain/entity/business_entity.dart';
import 'package:doodle_blur_task/app/features/business/domain/repo/business_repository.dart';

class BusinessUseCase extends UseCase<Either<Failure, BusinessEntity>,
    UseCaseRequestModel> {
  BusinessRepository businessRepository;
  BusinessUseCase({required this.businessRepository});

  @override
  Future<Either<Failure, BusinessEntity>> call() {
    var response = businessRepository.getBusinessData();
    return response;
  }
}