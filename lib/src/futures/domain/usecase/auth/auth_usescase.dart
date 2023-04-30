import '../../../../core/error/failuers.dart';
import '../../../../core/usescase/uses_case.dart';
import '../../entities/user_entity.dart';
import '../../repositories/auth_repository.dart';
import 'package:either_dart/src/either.dart';

class AuthUsesCaseImpl implements UsesCase<AuthResponseType, AuthUseCaseParam> {
  final AuthRepository authRepository;

  AuthUsesCaseImpl(this.authRepository);

  @override
  Future<Either<Failures, AuthResponseType>> call(AuthUseCaseParam params) async {
    switch (params.runtimeType) {
      case AuthStateParam:
        return await authRepository.getUserAuthState();
      case AuthLogOutParam:
        return await authRepository.inAppLogOut();
      case AuthSignInParam:
        return await authRepository.inAppSignIn(email: (params as AuthSignInParam).email, password: params.password);
      case AuthSignUpParam:
        return await authRepository.inAppSignUp(email: (params as AuthSignUpParam).email, password: params.password);
      default:
        return const Left(CacheFailure("Unknown param"));
    }
  }

}

abstract class AuthUseCaseParam {}

class AuthStateParam extends AuthUseCaseParam {}

class AuthLogOutParam extends AuthUseCaseParam {}

class AuthSignInParam extends AuthUseCaseParam {
  final String email;
  final String password;

  AuthSignInParam({required this.email, required this.password});
}

class AuthSignUpParam extends AuthUseCaseParam {
  final String email;
  final String password;

  AuthSignUpParam({required this.email, required this.password});
}

abstract class AuthResponseType{}

class Authenticated extends AuthResponseType{
  UserEntity userEntity;

  Authenticated(this.userEntity);
}

class UnAuthenticated extends AuthResponseType{}

class AuthError extends AuthResponseType{
  final String message;

  AuthError(this.message);
}

class AuthenticatedButNoInfo extends AuthResponseType{}

class UserNotExist extends AuthResponseType{}

