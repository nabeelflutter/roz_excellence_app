import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rose_excellence/repository/auth_model.dart';
import 'forget_password_event.dart';
import 'forget_password_state.dart';

class ForgetPasswordBloc extends  Bloc<ForgetPasswordScreenEvents,ForgetPasswordScreenStates>{
  String forgetPasswordResult='Success';


  AuthModel auth=AuthModel();
  ForgetPasswordBloc(super.initialState){

    on<SendEmailEvent>((event, emit) async {
      emit(ForgetPasswordScreenLoadingState());

      await auth.forgetPassowrd(email: event.email);
      if(forgetPasswordResult.contains('Success')){
        emit(ForgetPasswordScreenLoadedState());
      }
      else {
        emit(ForgetPasswordScreenErrorState(error: forgetPasswordResult));
      }

    });

  }
}