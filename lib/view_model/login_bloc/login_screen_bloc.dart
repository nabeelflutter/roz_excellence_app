import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/auth_model.dart';
import 'login_screen_events.dart';
import 'login_screen_states.dart';


class LoginScreenBloc extends Bloc<LoginScreenEvents,LoginScreenStates>{
  String loginResult='';
  AuthModel authModel= AuthModel();
  UserCredential? userCredentials;
  String resultOfCheckingUser='';
  String resultOfCheckingRegistrationStatus='';

  LoginScreenBloc(super.initialState){
  on<LoginEvent>((event, emit) async {
    emit(LoginScreenLoadingState());

    loginResult= await authModel.login(email: event.email, password: event.password);
    if(loginResult == 'Success'){
      emit(LoginScreenLoadedState());
    }
    else{
      emit(LoginScreenErrorState(error: loginResult.toString()));
    }
  }
  );
  }
}