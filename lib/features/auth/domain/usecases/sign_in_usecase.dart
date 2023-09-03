
import 'package:skid/features/auth/domain/entities/user.dart';
import 'package:skid/features/auth/domain/repository/firebase_repository.dart';

class SignInUseCase{
 final FirebaseRepository repository;

  SignInUseCase(this.repository);

Future<void> call(UserEntity user){
return repository.signIn(user);
}
}