

import 'package:barterra2/src/futures/domain/entities/user_entity.dart';

class UserModel extends UserEntity{
  const UserModel({required super.uid, required super.email});
  
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(uid: json["uid"], email: json["email"]);
  
}