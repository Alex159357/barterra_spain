

import 'package:either_dart/either.dart';

import '../error/failuers.dart';

abstract class UsesCase<Type, Params>{
  Future<Either<Failures, Type>> call(Params params);
}

class NoParams{
}

