part of 'skid_cubit.dart';

abstract class SkidState extends Equatable {
  const SkidState();
}

class SkidInitial extends SkidState {
  @override
  List<Object> get props => [];
}


class ProfileImagePikerLoadingState extends SkidState {
  @override
  List<Object> get props => [];
}

class ProfileImagePikerSuccessState extends SkidState {
  @override
  List<Object> get props => [];
}

class ProfileImagePikerErrorState extends SkidState {
  final String messageError;

  const ProfileImagePikerErrorState({required this.messageError});
  @override
  List<Object?> get props => [messageError];

}


