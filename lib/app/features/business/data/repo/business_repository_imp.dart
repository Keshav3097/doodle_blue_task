


import 'package:dartz/dartz.dart';
import 'package:doodle_blur_task/app/core/http_helper/errors/exception.dart';
import 'package:doodle_blur_task/app/core/http_helper/errors/failure.dart';
import 'package:doodle_blur_task/app/core/http_helper/models/request_model.dart';
import 'package:doodle_blur_task/app/features/business/data/data_source/business_data_source.dart';
import 'package:doodle_blur_task/app/features/business/domain/entity/business_entity.dart';
import 'package:doodle_blur_task/app/features/business/domain/repo/business_repository.dart';

class BusinessRepositoryImpl extends BusinessRepository {
  BusinessDataSource businessDataSource;

  BusinessRepositoryImpl({required this.businessDataSource});

  @override
  Future<Either<Failure, BusinessEntity>> getBusinessData() async {
    try {
      final response = await businessDataSource.getBusiness();
      if (response.status == RequestStatus.SUCCESS) {
        return Right(
          response.body!,
        );
      } else {
        return Left(
          Error(response.message ?? response.message!),
        );
      }
    } on ServerException {
      return const Left(
        ServerFailure('An error has occurred'),
      );
    }
  }

}