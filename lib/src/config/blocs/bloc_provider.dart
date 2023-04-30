


import 'package:barterra2/src/di/injection_container.dart';
import 'package:barterra2/src/futures/presentation/blocs/auth/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../futures/presentation/blocs/screen_status/screen_status_cubit.dart';


final blocProviderList = [

  BlocProvider<AuthBloc>(create: (context)=>getIt.get<AuthBloc>()),
  BlocProvider<ScreenStatusCubit>(create: (context)=>getIt.get<ScreenStatusCubit>()),

 ];