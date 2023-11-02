
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rose_excellence/view_model/signup_bloc/signup_event.dart';
import 'package:rose_excellence/view_model/signup_bloc/signup_state.dart';


import '../../models/buyer.dart';
import '../../repository/auth_model.dart';


//third step for creating a bloc
class SignUpScreenBloc extends Bloc<SignUpScreenEvents, SignUpScreenStates> {
  String resultOfAuthentication = '';

  UserCredential? userCredentials;
  String resultOfGoogleDataStorage = '';
  String resultOfUploadingUserToDbFromPhone='';

  AuthModel authModel = AuthModel();
  String resultOfUploadingUserToDB = '';
  SignUpScreenBloc(super.initialState) {

    //this code will execute when we will send signupwithemailandpassword event
    on<SignUpWithEmailAndPassword>((event, emit) async {
      emit(SignUpScreenLoadingState());
        resultOfAuthentication = await authModel.signUp(
            email: event.userObject.email,
            password: event.userObject.password);
      if (resultOfAuthentication == 'Success') {
        print('-------executing db');

        resultOfUploadingUserToDB = await authModel.addBuyerToDB(event.userObject);

        print('-------executed db');

        print(resultOfUploadingUserToDB+'happening');
        emit(SignUpScreenLoadedState());
      } else {
        emit(SignUpScreenErrorState(
            error:
            'Authentication failed due to this reason ${resultOfAuthentication}'));
      }
    });
  }
}
