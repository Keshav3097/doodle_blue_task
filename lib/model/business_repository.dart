

import 'package:dartz/dartz.dart';
import 'package:doodle_blur_task/http_helper/errors/failure.dart';
import 'package:doodle_blur_task/http_helper/models/request_model.dart';
import 'package:doodle_blur_task/model/business_response_model.dart';
import 'package:doodle_blur_task/model/services/base_service.dart';
import 'package:doodle_blur_task/model/services/business_service.dart';

import '../http_helper/errors/exception.dart';

class BusinessRepository {
  final BaseService _businessService = BusinessService();

  Future<Either<Failure,List<BusinessResponseModel>>> fetchBusinessList(String value) async {

    try {
      dynamic response = await _businessService.getResponse(value);
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
        ServerFailure('Error(Repo) : ServerException'),
      );
    }

  }
}
