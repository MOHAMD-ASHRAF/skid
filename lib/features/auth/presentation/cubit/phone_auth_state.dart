part of 'phone_auth_cubit.dart';

abstract class PhoneAuthState extends Equatable {
  const PhoneAuthState();
}

class PhoneAuthInitial extends PhoneAuthState {
  @override
  List<Object> get props => [];
}

class LoadingState extends PhoneAuthState{
  @override
  List<Object?> get props => [];
}

class PhoneAuthErrorState extends PhoneAuthState{
   final String messageError;

  const PhoneAuthErrorState({required this.messageError});


  @override
  List<Object?> get props => [messageError];


}
class PhoneNumberSubmitedState extends PhoneAuthState{
  @override
  List<Object?> get props => [];


}

class PhoneOTPVerifiedState extends PhoneAuthState{
  @override

  List<Object?> get props => [];

}



class LoginLoadingState extends  PhoneAuthState{
  @override
  List<Object?> get props => [];
}

class LoginSuccessState extends  PhoneAuthState{
  @override
  List<Object?> get props => [];
}


class LoginErrorState extends  PhoneAuthState{
  final String messageError;

  const LoginErrorState({required this.messageError});

  @override
  List<Object?> get props => [messageError];


}
