

import 'package:either_dart/either.dart';

import '../../../core/error/failuers.dart';
import '../usecase/auth/auth_usescase.dart';

abstract class AuthRepository{

  Future<Either<Failures, AuthResponseType>> getUserAuthState();

  Future<Either<Failures, AuthResponseType>> inAppLogOut();

  Future<Either<Failures, AuthResponseType>> inAppSignIn({required String email, required String password});

  Future<Either<Failures, AuthResponseType>> inAppSignUp({required String email, required String password});

}