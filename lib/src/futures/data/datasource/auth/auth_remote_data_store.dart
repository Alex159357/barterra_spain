

import '../../../domain/usecase/auth/auth_usescase.dart';

abstract class AuthRemoteDataStore{
  Future<AuthResponseType?> getAuthState();
  Future<AuthResponseType?> inAppLogOut();
  Future<AuthResponseType?> inAppSignIn({required String email, required String password});
  Future<AuthResponseType?> inAppSignUp({required String email, required String password});

}