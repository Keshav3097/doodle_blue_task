import 'package:dartz/dartz.dart';
import 'package:doodle_blur_task/http_helper/errors/failure.dart';
import 'package:doodle_blur_task/model/apis/api_response.dart';
import 'package:doodle_blur_task/model/business_repository.dart';
import 'package:flutter/cupertino.dart';

import '../model/business_response_model.dart';

class BusinessViewModel {

  Future<Either<Failure,List<BusinessResponseModel>>> fetchBusinessData(String value) async {
    try {
      Either<Failure,List<BusinessResponseModel>> data = await BusinessRepository().fetchBusinessList(value);
      return data;
    } catch (e) {
      return Left(
        ServerFailure('Error(Business View Model) : $e'),
      );
    }
  }

}
