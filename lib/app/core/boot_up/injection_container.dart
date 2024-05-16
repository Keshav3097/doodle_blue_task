import 'package:doodle_blur_task/app/features/business/data/data_source/business_data_source.dart';
import 'package:doodle_blur_task/app/features/business/data/repo/business_repository_imp.dart';
import 'package:doodle_blur_task/app/features/business/domain/repo/business_repository.dart';
import 'package:doodle_blur_task/app/features/business/domain/use_cases/business_use_case.dart';
import 'package:doodle_blur_task/app/features/business/presentation/bloc/business_bloc.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

void setUpLocator() {
  ///Bloc
  serviceLocator.registerFactory(
        () =>
        BusinessBloc(businessUseCase: serviceLocator()),
  );


  ///UseCase
  serviceLocator.registerLazySingleton(
        () =>
        BusinessUseCase(businessRepository: serviceLocator()),
  );

  ///Repository
  serviceLocator.registerLazySingleton<BusinessRepository>(
        () =>
            BusinessRepositoryImpl(businessDataSource: serviceLocator()),
  );

  ///DataSource
  serviceLocator.registerLazySingleton<BusinessDataSource>(
        () =>
            BusinessDataSourceImpl(),
  );
}