

import 'package:dartz/dartz.dart';
import 'package:doodle_blur_task/app/core/http_helper/errors/failure.dart';
import 'package:doodle_blur_task/app/features/business/domain/entity/business_entity.dart';

abstract class BusinessRepository {
  Future<Either<Failure, BusinessEntity>> getBusinessData();
}