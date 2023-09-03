import 'package:firebase_auth/firebase_auth.dart';
import 'package:skid/features/auth/domain/entities/user.dart';

abstract class FireBaseDataSource{
  Future<void> signIn(UserEntity user);
}


class FireBaseDataSourceImpl implements FireBaseDataSource{

  final FirebaseAuth auth;

  FireBaseDataSourceImpl({required this.auth});

  @override
  Future<void> signIn(UserEntity user) async {
    await auth.signInWithEmailAndPassword(
        email: user.email!, password: user.phone!);
  }
}