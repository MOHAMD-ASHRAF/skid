
import 'package:skid/features/auth/domain/entities/user.dart';

abstract class FirebaseRepository{
  Future<void> signIn(UserEntity user);
  Future<void> googleAuth();
  Future<void> confirmOTP();
}