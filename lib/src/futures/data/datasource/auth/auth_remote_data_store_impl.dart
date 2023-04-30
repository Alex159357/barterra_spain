import 'package:barterra2/src/core/data/client/api_client.dart';
import '../../../../core/error/exceptions.dart';
import '../../../domain/usecase/auth/auth_usescase.dart';
import 'auth_remote_data_store.dart';

class AuthRemoteDataStoreImpl implements AuthRemoteDataStore{
  final ApiClient apiClient;

  AuthRemoteDataStoreImpl(this.apiClient);

  @override
  Future<AuthResponseType> getAuthState() async {
    try{
      return await apiClient.getAuthState();
    }catch(e){
      throw ServerException(e.toString());
    }
  }

  @override
  Future<AuthResponseType> inAppLogOut() async{
    try{
      return await apiClient.logOut();
    }catch(e){
      throw ServerException(e.toString());
    }
  }

  @override
  Future<AuthResponseType> inAppSignIn({required String email, required String password}) async {
    try{
      return await apiClient.signIn(email: email, password: password);
    }catch(e){
      throw ServerException(e.toString());
    }
  }

  @override
  Future<AuthResponseType> inAppSignUp({required String email, required String password}) async {
    try{
      return await apiClient.signUp(email: email, password: password);
    }catch(e){
      throw ServerException(e.toString());
    }
  }
}