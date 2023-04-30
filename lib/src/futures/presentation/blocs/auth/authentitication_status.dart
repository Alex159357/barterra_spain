

abstract class AuthenticationStatus{

  const AuthenticationStatus();
}


class AuthStatusAuthenticated extends AuthenticationStatus{}

class AuthStatusAuthenticatedButNoInfoAuthEvent extends AuthenticationStatus{}

class AuthStatusUnAuthenticated extends AuthenticationStatus{

  const AuthStatusUnAuthenticated();
}