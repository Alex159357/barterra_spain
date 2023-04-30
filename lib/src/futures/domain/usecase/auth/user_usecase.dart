

import 'package:barterra2/src/core/error/failuers.dart';
import 'package:barterra2/src/core/usescase/uses_case.dart';
import 'package:barterra2/src/futures/domain/entities/user_entity.dart';
import 'package:either_dart/src/either.dart';

import '../../repositories/auth_repository.dart';

class UserUseCaseImpl implements UsesCase<UserEntity, String>{
  final AuthRepository authRepository;

  UserUseCaseImpl(this.authRepository);

  @override
  Future<Either<Failures, UserEntity>> call(String params) {
    // TODO: implement call
    throw UnimplementedError();
  }

}