import 'dart:async';
import 'package:barterra2/src/futures/domain/usecase/auth/auth_usescase.dart';
import 'package:barterra2/src/futures/domain/usecase/auth/user_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/error/failuers.dart';
import '../screen_status/screen_status_cubit.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'authentitication_status.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUsesCaseImpl authUsesCase;
  final UserUseCaseImpl userUseCase;
  final ScreenStatusCubit screenStatusCubit;

  get init => add(AuthInitEvent());
  void trySignIn() => add(TrySignInAuthEvent());
  void trySignUp() => add(TrySignUpAuthEvent());
  void trySignOut() => add(TrySignOutAuthEvent());

  AuthBloc({required this.authUsesCase, required this.userUseCase, required this.screenStatusCubit}) : super(AuthState().init()) {
    on<AuthInitEvent>(_init);
    on<AuthenticatedAuthEvent>(_authenticatedAuthEvent);
    on<UnAuthenticatedAuthEvent>(_unAuthenticatedAuthEvent);
    on<ErrorAuthEvent>(_errorAuthEvent);
    on<AuthenticatedButNoInfoAuthEvent>(_authenticatedButNoInfoAuthEvent);
    on<UserNotExistAuthEvent>(_userNotExistAuthEvent);
    on<TrySignInAuthEvent>(_trySignInAuthEvent);
    on<TrySignUpAuthEvent>(_trySignUpAuthEvent);
    on<TrySignOutAuthEvent>(_trySignOutAuthEvent);
  }

  void _init(AuthInitEvent event, Emitter<AuthState> emit) async {
    screenStatusCubit.showLoadingScreen();
    final param = AuthStateParam();
    final authState = await authUsesCase(param);
    authState.fold((left) => _listenAuthError, (right) => _listenForAuthState(right));
    emit(state.clone());
    screenStatusCubit.hideLoadingScreen();
  }


  FutureOr<void> _authenticatedAuthEvent(AuthenticatedAuthEvent event, Emitter<AuthState> emit) {
    if (kDebugMode) {
      print("AuthenticatedAuthEvent");
    }

    emit(state.clone(authenticationStatus: AuthStatusAuthenticated()));
  }

  FutureOr<void> _unAuthenticatedAuthEvent(UnAuthenticatedAuthEvent event, Emitter<AuthState> emit) {
    if (kDebugMode) {
      print("UnAuthenticatedAuthEvent");
    }
    emit(state.clone(authenticationStatus: const AuthStatusUnAuthenticated()));
  }

  FutureOr<void> _errorAuthEvent(ErrorAuthEvent event, Emitter<AuthState> emit) {
    if (kDebugMode) {
      print("ErrorAuthEvent");
    }
    emit(state.clone(authenticationStatus: const AuthStatusUnAuthenticated()));
  }

  FutureOr<void> _authenticatedButNoInfoAuthEvent(AuthenticatedButNoInfoAuthEvent event, Emitter<AuthState> emit) {
    if (kDebugMode) {
      print("AuthenticatedButNoInfoAuthEvent");
    }
    emit(state.clone(authenticationStatus: AuthStatusAuthenticatedButNoInfoAuthEvent()));
  }

  FutureOr<void> _userNotExistAuthEvent(UserNotExistAuthEvent event, Emitter<AuthState> emit) {
    emit(state.clone(authenticationStatus: AuthStatusAuthenticatedButNoInfoAuthEvent()));
  }

  FutureOr<void> _trySignInAuthEvent(TrySignInAuthEvent event, Emitter<AuthState> emit) async {
    screenStatusCubit.showLoadingScreen();
    AuthUseCaseParam param = AuthSignInParam(email: state.email, password:  state.password);
    final signInResult = await authUsesCase(param);
    signInResult.fold(_listenAuthError,  _listenForAuthState);
    screenStatusCubit.hideLoadingScreen();
  }

  FutureOr<void> _trySignOutAuthEvent(TrySignOutAuthEvent event, Emitter<AuthState> emit) async {
    screenStatusCubit.showLoadingScreen();
    AuthUseCaseParam param = AuthLogOutParam();
    final signInResult = await authUsesCase(param);
    signInResult.fold( _listenAuthError, _listenForAuthState);
    screenStatusCubit.hideLoadingScreen();
  }

  FutureOr<void> _trySignUpAuthEvent(TrySignUpAuthEvent event, Emitter<AuthState> emit) async {
    screenStatusCubit.showLoadingScreen();
    Fluttertoast.showToast(msg: "TestSignUp");
    AuthUseCaseParam param = AuthSignUpParam(email: state.email+"1", password:  state.password);
    final signInResult = await authUsesCase(param);
    signInResult.fold(_listenAuthError,  _listenForAuthState);
    screenStatusCubit.hideLoadingScreen();
  }

  void _listenAuthError(Failures failures){
    switch(failures.runtimeType){
      case ServerFailure: screenStatusCubit.showErrorDialog(message: (failures as ServerFailure).message); break;
      case CacheFailure: screenStatusCubit.showErrorDialog(message: (failures as CacheFailure).message); break;
    }

  }

  void _listenForAuthState(AuthResponseType authResponseType) {
    switch (authResponseType.runtimeType) {
      case Authenticated:
        add(AuthenticatedAuthEvent((authResponseType as Authenticated).userEntity));
        break;
      case UnAuthenticated:
        add(UnAuthenticatedAuthEvent());
        break;
      case AuthError:
        add(ErrorAuthEvent((authResponseType as AuthError).message));
        break;
      case AuthenticatedButNoInfo:
        add(AuthenticatedButNoInfoAuthEvent());
        break;
      case UserNotExist:
        add(AuthInitEvent());
        break;
    }
  }
}
