import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:rose_excellence/view_model/signup_bloc/signup_state.dart';

import '../../repository/auth_model.dart';

part 'signin_with_google_event.dart';

part 'signin_with_google_state.dart';

class SocialSignInBloc
    extends Bloc<SocialSignInEvent, SocialSignInState> {
  final AuthModel _authModel = AuthModel();
  SocialSignInBloc() : super(SocialSignInInitial()) {

    on<SignInWithGoogleClickEvent>((event, emit) async {
      emit.call(SigninLoadingState());
      try {
        final user = await _authModel.signInWithGoogle();
        if (user != null) {
          emit.call(SigninLoadedState(user));
        } else {
          emit.call(SigninErrorState(error: 'Some thing went wrong'));
        }
      } on FirebaseAuthException catch (error) {
        print(error);
        emit.call(SigninErrorState(error: error.toString()));
      } catch (error) {
        print(error);
         emit.call(SigninErrorState(error: error.toString()));
      }
    });

    on<SignInWithFaceBookClickEvent>((event, emit) async {
      emit.call(SigninLoadingState());
      try{
        final user = await _authModel.signInWithFacebook();
        if(user != null){
          emit.call(SigninLoadedState(user));
        }
      }
      on FirebaseAuthException catch(error){
        print(error);
        emit.call(SigninErrorState(error: error.toString()));
      }
      catch(error){
        print(error);
        emit.call(SigninErrorState(error: error.toString()));

      }
    });
  }
}
