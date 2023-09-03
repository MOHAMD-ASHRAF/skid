import 'package:skid/features/auth/domain/repository/firebase_repository.dart';

class GoogleAuthUseCase{
  final FirebaseRepository repository;

  GoogleAuthUseCase({required this.repository});

  Future<void> googleAuth(){
    return repository.googleAuth();
  }

}