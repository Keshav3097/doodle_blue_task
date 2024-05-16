

import 'package:doodle_blur_task/app/features/business/domain/use_cases/business_use_case.dart';
import 'package:doodle_blur_task/app/features/business/presentation/bloc/business_event.dart';
import 'package:doodle_blur_task/app/features/business/presentation/bloc/business_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessBloc extends Bloc<BusinessEvents,BusinessState> {
  BusinessUseCase businessUseCase;
  BusinessBloc({required this.businessUseCase}) :super(InitialState()) {
    on<GetBusinessesEvent>(getProductData);
  }

  Future<void> getProductData(event, emit) async {
    emit(LoadingState());
    final data = await businessUseCase.call();
    data.fold((l) => emit(ErrorState(msg: l.message)),
            (r) => emit(LoadedState(data: r)));
  }
}