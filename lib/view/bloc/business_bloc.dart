

import 'package:doodle_blur_task/view/bloc/business_event.dart';
import 'package:doodle_blur_task/view/bloc/business_state.dart';
import 'package:doodle_blur_task/view_model/business_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessBloc extends Bloc<BusinessEvents,BusinessState> {
  BusinessBloc() :super(InitialState()) {
    on<GetBusinessesEvent>(getProductData);
  }

  Future<void> getProductData(event, emit) async {
    emit(LoadingState());
    final data = await BusinessViewModel().fetchBusinessData("products");
    data.fold((l) => emit(ErrorState(msg: l.message)),
            (r) => emit(LoadedState(data: r)));
  }
}