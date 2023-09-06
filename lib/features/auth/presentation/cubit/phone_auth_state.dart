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

class ErrorState extends PhoneAuthState{
   final String message;

  const ErrorState({required this.message});


  @override
  List<Object?> get props => [message];


}
class PhoneNumberSubmitedState extends PhoneAuthState{
  @override
  List<Object?> get props => [];


}

class PhoneOTPVerifiedState extends PhoneAuthState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
