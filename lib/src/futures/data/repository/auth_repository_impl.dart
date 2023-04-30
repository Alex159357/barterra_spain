import 'package:barterra2/src/core/error/failuers.dart';
import 'package:barterra2/src/futures/domain/entities/user_entity.dart';
import 'package:either_dart/src/either.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/network/info/network_info.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecase/auth/auth_usescase.dart';
import '../datasource/auth/auth_remote_data_store.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataStore authRemoteDataStore;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({required this.authRemoteDataStore, required this.networkInfo});

  @override
  Future<Either<Failures, AuthResponseType>> getUserAuthState() async {
    try {
      final authState = await authRemoteDataStore.getAuthState();
      return _handleEStatus(authState);
    } on CacheException {
      return const Left(CacheFailure(""));
    }
  }

  @override
  Future<Either<Failures, AuthResponseType>> inAppSignIn({required String email, required String password}) async {
    try {
      final authState = await authRemoteDataStore.inAppSignIn(email: email, password: password);
      return _handleEStatus(authState);
    } on CacheException {
      return const Left(CacheFailure(""));
    }
  }

  @override
  Future<Either<Failures, AuthResponseType>> inAppSignUp({required String email, required String password}) async {
    try {
      final authState = await authRemoteDataStore.inAppSignUp(email: email, password: password);
      return _handleEStatus(authState);
    } on CacheException {
      return const Left(CacheFailure(""));
    }
  }

  @override
  Future<Either<Failures, AuthResponseType>> inAppLogOut() async{
    try {
      final authState = await authRemoteDataStore.inAppLogOut();
      return _handleEStatus(authState);
    } on CacheException {
      return const Left(CacheFailure(""));
    }
  }

  Either<Failures, AuthResponseType> _handleEStatus(AuthResponseType? authResponseType) {
    if(authResponseType is AuthError || authResponseType == null){
      if(authResponseType != null) {
        return Left(CacheFailure((authResponseType as AuthError).message));
      } else{
        return const Left(CacheFailure(""));
      }
    }else{
      return Right(authResponseType);
    }
  }


}
