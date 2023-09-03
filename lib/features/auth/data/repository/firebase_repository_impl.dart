
import 'package:skid/features/auth/data/data_sources/firebase_data_source.dart';
import 'package:skid/features/auth/domain/entities/user.dart';
import 'package:skid/features/auth/domain/repository/firebase_repository.dart';

class FireBaseRepositoryImpl  implements FirebaseRepository{

  final FireBaseDataSource fireBaseDataSource;

  FireBaseRepositoryImpl(this.fireBaseDataSource);
  @override
  Future<void> confirmOTP() {
    // TODO: implement confirmOTP
    throw UnimplementedError();
  }

  @override
  Future<void> googleAuth() {
    // TODO: implement googleAuth
    throw UnimplementedError();
  }

  @override
  Future<void> signIn(UserEntity user) => fireBaseDataSource.signIn(user);

}