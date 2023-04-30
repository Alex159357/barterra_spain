import 'package:barterra2/src/futures/presentation/blocs/auth/auth_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension ContextExtantion on BuildContext{
  AuthBloc get authBloc => BlocProvider.of<AuthBloc>(this);
  // ThemeCubit get themeCubit => BlocProvider.of<ThemeCubit>(this);
}