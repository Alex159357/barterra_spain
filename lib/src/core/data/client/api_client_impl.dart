

import 'package:fluttertoast/fluttertoast.dart';

import '../../error/exceptions.dart';
import '../../../futures/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../futures/domain/usecase/auth/auth_usescase.dart';
import 'api_client.dart';

class ApiClientImpl implements ApiClient{

  final FirebaseAuth auth;

  ApiClientImpl(this.auth);

  @override
  Future<AuthResponseType> getAuthState() async {
    try{
      final user = auth.currentUser;
      if(user != null){
        UserEntity? userEntity = await getUser(user.uid);
        if(userEntity != null) {
          return Authenticated(userEntity);
        } else {
          return AuthenticatedButNoInfo();
        }
      }else {
        return UnAuthenticated();
      }
    }on FirebaseAuthException catch (e){
      return AuthError(e.message.toString());
    }
  }

  @override
  Future<UserEntity?> getUser(String uid) async {
    try{
      final user = auth.currentUser;
      UserEntity? userEntity;
      if(user != null){
        userEntity = UserEntity(uid: user.uid, email: user.email?? "");
      }
      return userEntity;
    }on FirebaseAuthException catch (e){
      throw ServerException(e.toString());
    }
  }

  @override
  Future<AuthResponseType> logOut() async {
   try{
     await auth.signOut();
     return UnAuthenticated();
   }on FirebaseAuthException catch (e){
     return AuthError(e.message.toString());
   }
  }

  @override
  Future<AuthResponseType> signIn({required String email, required String password}) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
     return await _checkAuthState(userCredential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return AuthError("No user found for that email.");
      } else if (e.code == 'wrong-password') {
        return AuthError("Wrong password provided for that user.");
      }else{
        return AuthError(e.message.toString());
      }
    }
  }

  @override
  Future<AuthResponseType> signUp({required String email, required String password}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      return await _checkAuthState(userCredential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return AuthError('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return AuthError('The account already exists for that email.');
      }
      return AuthError(e.toString());
    } catch (e) {
      return AuthError(e.toString());
    }
  }

  Future<AuthResponseType> _checkAuthState(UserCredential userCredential) async{
    if(userCredential.user != null) {
      final fbUser = await getUser(userCredential.user!.uid);
      UserEntity? userEntity = await getUser(fbUser!.uid);
      return userEntity != null? Authenticated(userEntity) : AuthenticatedButNoInfo();
    }else {
      return UserNotExist();
    }
  }

}