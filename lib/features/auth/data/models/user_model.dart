import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skid/features/auth/domain/entities/user.dart';


class UserModel extends UserEntity {
  const UserModel({
    final String? name,
    final String? email,
    final String? phone,
  }) : super(name, email, phone);



  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return  UserModel(
      name: snapshot.get('name'),
      email: snapshot.get('email'),
      phone: snapshot.get('phoneNumber'),
    );
  }



  Map<String,dynamic> toDocument(){
    return {
      "name": name,
      "email": email,
      "phone": phone,
    };
  }
}
