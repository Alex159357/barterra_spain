import 'package:barterra2/src/futures/domain/entities/user_entity.dart';

abstract class AuthEvent {}

class AuthInitEvent extends AuthEvent {}

class AuthenticatedAuthEvent extends AuthEvent{
  final UserEntity userEntity;

  AuthenticatedAuthEvent(this.userEntity);
}

class UnAuthenticatedAuthEvent extends AuthEvent{}

class ErrorAuthEvent extends AuthEvent{
  final String message;

  ErrorAuthEvent(this.message);
}

class AuthenticatedButNoInfoAuthEvent extends AuthEvent{}

class UserNotExistAuthEvent extends AuthEvent{}

class TrySignInAuthEvent extends AuthEvent{
}
class TrySignOutAuthEvent extends AuthEvent{
}

class TrySignUpAuthEvent extends AuthEvent{
}