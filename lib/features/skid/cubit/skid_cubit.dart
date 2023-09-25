import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'skid_state.dart';

class SkidCubit extends Cubit<SkidState> {
  SkidCubit() : super(SkidInitial());

  File? profileImage;
  var picker =ImagePicker();


  Future<void> getProfileImageFromGallery(BuildContext context) async{
    emit(ProfileImagePikerLoadingState());
    final pikedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pikedFile != null){
      //Navigator.of(context).pop();
      profileImage =File(pikedFile.path);
      emit(ProfileImagePikerSuccessState());
    }else
    {
      emit(const ProfileImagePikerErrorState(messageError: 'no image selected'));
    }
  }


  Future<void> getProfileImageFromCamera(BuildContext context) async{
    emit(ProfileImagePikerLoadingState());
    final pikedFile = await picker.pickImage(source: ImageSource.camera);
    if (pikedFile != null){
      profileImage =File(pikedFile.path);
      //Navigator.of(context).pop();
      emit(ProfileImagePikerSuccessState());
    }else
    {
      emit(const ProfileImagePikerErrorState(messageError: 'no image selected'));
    }
  }


}
