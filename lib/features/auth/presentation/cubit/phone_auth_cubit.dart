import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  late String verificationId;
  CollectionReference users = FirebaseFirestore.instance.collection('users');


  PhoneAuthCubit() : super(PhoneAuthInitial());

  Future<void> submitPhoneNumber(String phoneNumber) async {
    emit(LoadingState());
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      timeout: const Duration(seconds: 60),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    print('verificationCompleted');
    await signIn(credential);
  }

  void verificationFailed(FirebaseAuthException error) {
    print('verificationFailed : ${error.toString()}');
    emit(PhoneAuthErrorState(messageError: error.toString()));
  }

  void codeSent(String verificationId, int? resendToken) {
    print('codeSent');
    this.verificationId = verificationId;
    emit(PhoneNumberSubmitedState());
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    print('codeAutoRetrievalTimeout');
  }

  Future<void> submitOTP(String otpCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otpCode);
    await signIn(credential);
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    try{
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(PhoneOTPVerifiedState());
    }catch(error){
      emit(PhoneAuthErrorState(messageError: error.toString()));
    }
  }


  Future<void> logOut()async{
  await FirebaseAuth.instance.signOut();
  }

  Future<void> addUser({required String name, required String email}) async{
    emit(LoginLoadingState());

    return await users
        .add({
      'name': name,
      'email': email,
    })
        .then((value) {
      emit(LoginSuccessState());
      print("User Added");

    })
        .catchError((error){
      emit(LoginErrorState(messageError: error));
      print("Failed to add user: $error");
    });
  }

}
