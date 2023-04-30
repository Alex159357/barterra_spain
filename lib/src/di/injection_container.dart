import 'package:firebase_auth/firebase_auth.dart';

import '../core/data/client/api_client.dart';
import '../core/data/client/api_client_impl.dart';
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:get_it/get_it.dart';

import '../core/network/info/network_info.dart';
import '../core/network/info/network_info_impl.dart';
import '../futures/data/datasource/auth/auth_remote_data_store.dart';
import '../futures/data/datasource/auth/auth_remote_data_store_impl.dart';
import '../futures/data/repository/auth_repository_impl.dart';
import '../futures/domain/repositories/auth_repository.dart';
import '../futures/domain/usecase/auth/auth_usescase.dart';
import '../futures/domain/usecase/auth/user_usecase.dart';
import '../futures/presentation/blocs/auth/auth_bloc.dart';
import '../futures/presentation/blocs/screen_status/screen_status_cubit.dart';

late GetIt getIt;

class InjectionContainer {
  static InjectionContainer get instance {
    getIt = GetIt.instance;
    return InjectionContainer();
  }

  Future<void> init() async {
    //usecase
    _initUseCases();
    // repository
    _initRepositories();
    // Data sources
    _initDataSources();
    //client
    _initClient();
    //blocs / cubit
    _initBlocs();
  }

  void _initUseCases(){
    getIt.registerLazySingleton(() => AuthUsesCaseImpl(getIt()));
    getIt.registerLazySingleton(() => UserUseCaseImpl(getIt()));
  }

  void _initRepositories(){
    getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(authRemoteDataStore: getIt(), networkInfo: getIt()));
  }

  void _initDataSources(){
    getIt.registerLazySingleton<AuthRemoteDataStore>(() => AuthRemoteDataStoreImpl(getIt()));
  }

  void _initClient(){
    getIt.registerLazySingleton(() => DataConnectionChecker());
    getIt.registerLazySingleton(() => FirebaseAuth.instance);
    getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));
    getIt.registerLazySingleton<ApiClient>(() => ApiClientImpl(getIt()));
  }

  void _initBlocs(){
    getIt.registerLazySingleton<ScreenStatusCubit>(() => ScreenStatusCubit());
    getIt.registerLazySingleton<AuthBloc>(() => AuthBloc(
        authUsesCase: getIt(), userUseCase: getIt(), screenStatusCubit: getIt()));
  }

}
