
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:rose_excellence/view_model/user_info_screen_bloc/user_info_screen_event.dart';
import 'package:rose_excellence/view_model/user_info_screen_bloc/user_info_screen_state.dart';

import '../../repository/auth_model.dart';


class UserInfoScreenBloc extends Bloc<UserInfoScreenEvents,UserInfoScreenStates>{
  String resultOfUploadingImageToFirebase='';
  String resultOfUploadingImageUrlToDatabase='';
  String resultOfUpdateUserDetailsToDatabase='';
  String dob='';
  String date='';

  AuthModel authModel= AuthModel();
  UserInfoScreenBloc(super.initialState){
    on<UserInfoScreenPickImageEvent>((event, emit) async {
      emit(UserInfoScreenDetailLoadingState());
      if(event.image!=null){
        resultOfUploadingImageToFirebase=await authModel.addImageToFirebaseStorage(file: event.image);
        print('image result is ${resultOfUploadingImageToFirebase}');
      }

      if(!resultOfUploadingImageToFirebase.contains('Something went wrong')){

       resultOfUploadingImageUrlToDatabase= await authModel.updateProfilePicture(imageUrl: resultOfUploadingImageToFirebase);
       print('url result is ${resultOfUploadingImageUrlToDatabase}');

       if(resultOfUploadingImageUrlToDatabase=='Success'){
         print('Success');
         print('printing loaded url ${resultOfUploadingImageUrlToDatabase}');
         emit(UserInfoScreenImageChangedState(image: resultOfUploadingImageToFirebase));
       }
       else{
         emit(UserInfoScreenErrorState(error: resultOfUploadingImageUrlToDatabase));

       }

      }
      else{
        emit(UserInfoScreenErrorState(error: resultOfUploadingImageToFirebase));
      }


    });

    on<UserInfoScreenUpdateDetailsEvent>((event, emit) async {
      emit(UserInfoScreenLoadingState());
      if(event.dateOfBirth == null){
        dob='';
      }
      else{
        dob=event.dateOfBirth!;
      }
      resultOfUpdateUserDetailsToDatabase=await authModel.updateUserDetails(username: event.fullName!, dateOfBirth: event.dateOfBirth!,phoneOrEmail: event.phoneOrEmail);
      if(resultOfUpdateUserDetailsToDatabase=='Success'){
        emit(UserInfoScreenLoadedState());
      }
      else{
        emit(UserInfoScreenErrorState(error: resultOfUpdateUserDetailsToDatabase));

      }



    });

    on<UserInfoScreenDatePickedEvent>((event, emit) {
      date=DateFormat.yMd().format(event.date);
      emit(UserInfoScreenDatePickedStateState(date: date));
    });


  }

}