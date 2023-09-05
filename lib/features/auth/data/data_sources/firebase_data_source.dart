import 'package:firebase_auth/firebase_auth.dart';
import 'package:skid/features/auth/domain/entities/user.dart';

abstract class FireBaseDataSource{
  Future<void> signIn(UserEntity user);
  Future<void> phoneAuth();
}


class FireBaseDataSourceImpl implements FireBaseDataSource{

  final FirebaseAuth auth;

  FireBaseDataSourceImpl({required this.auth});

  @override
  Future<void> signIn(UserEntity user) async {
    await auth.signInWithEmailAndPassword(
        email: user.email!, password: user.phone!);
  }

  @override
  Future<void> phoneAuth()async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+44 7123 123 456',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}