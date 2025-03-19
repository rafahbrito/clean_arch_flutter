import 'package:dartz/dartz.dart';
import 'package:clean_arch_flutter/ui/widgets/async_button/bloc/button_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonCubit extends Cubit<ButtonState> {
  ButtonCubit() : super(ButtonInitalState());

  Future<void> execute(Function asyncFunction) async {
    emit(ButtonLoadingState());
    try {
      Either result = await asyncFunction();
      result.fold(
        (error) {
          emit(ButtonFailureState(errorMessage: error));
        },
        (data) {
          emit(ButtonSuccessState());
        },
      );
    } catch (e) {
      emit(ButtonFailureState(errorMessage: e.toString()));
    }
  }
}
