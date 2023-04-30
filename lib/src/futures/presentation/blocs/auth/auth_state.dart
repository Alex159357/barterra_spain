import 'authentitication_status.dart';

class AuthState {

  final AuthenticationStatus authenticationStatus;
  final String email;
  final String password;

  AuthState({this.authenticationStatus = const AuthStatusUnAuthenticated(), this.email =  "test@test.test", this.password = "123456"});

  AuthState init() {
    return AuthState();
  }

  AuthState clone({AuthenticationStatus? authenticationStatus, String? email, String? password}) => AuthState(
    authenticationStatus: authenticationStatus ?? this.authenticationStatus,
    email: email ?? this.email,
    password: password ?? this.password
  );
}
