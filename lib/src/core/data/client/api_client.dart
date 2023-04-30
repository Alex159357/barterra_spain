

import '../../../futures/domain/entities/user_entity.dart';
import '../../../futures/domain/usecase/auth/auth_usescase.dart';

abstract class ApiClient{

  Future<AuthResponseType> getAuthState();

  Future<UserEntity?> getUser(String uid);

  Future<AuthResponseType> signIn({required String email, required String password});

  Future<AuthResponseType> signUp({required String email, required String password});

  Future<AuthResponseType> logOut();

}