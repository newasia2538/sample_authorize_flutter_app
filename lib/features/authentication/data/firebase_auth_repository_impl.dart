import 'package:firebase_auth/firebase_auth.dart';
import 'package:sample_authorize_app/core/exception/auth_exception.dart';
import 'package:sample_authorize_app/core/extensions/string_extensions.dart';
import 'package:sample_authorize_app/features/authentication/domain/firebase_auth_repository.dart';

class FireBaseAuthRepositoryImpl implements FirebaseAuthRepository{
  final FirebaseAuth firebaseAuth;
  FireBaseAuthRepositoryImpl({required FirebaseAuth this.firebaseAuth});
  User? get currentUser => firebaseAuth.currentUser;
  Stream<User?> get authStateChange => firebaseAuth.authStateChanges();

  @override
  Future<void> changePassword(String email, String password, String newPassword) async {
    try{
      if(email.isNullOrEmpty()) throw AuthException('Invalid email.');
      if(password.isNullOrEmpty()) throw AuthException('Invalid password.');
      if(newPassword.isNullOrEmpty()) throw AuthException('Invalid new password.');

      final credential = EmailAuthProvider.credential(email: email, password: password);
      await currentUser?.reauthenticateWithCredential(credential);
      await currentUser?.updatePassword(newPassword);
    } on FirebaseAuthException catch(ex){
        throw AuthException(ex.message ?? 'Unable to change password, please try again later.');
    }
  }

  @override
  Future<UserCredential?> createAccount(String email, String password) {
    try{
      if(email.isNullOrEmpty()) throw AuthException('Invalid email.');
      if(password.isNullOrEmpty()) throw AuthException('Invalid password.');

      return firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(ex){
      throw AuthException(ex.message ?? 'Unable to create account, please try again later.');
    }
  }

  @override
  Future<void> deleteAccount(String email, String password) async {
    try{
      if(email.isNullOrEmpty()) throw AuthException('Invalid email.');
      if(password.isNullOrEmpty()) throw AuthException('Invalid password.');

      final credential = EmailAuthProvider.credential(email: email, password: password);
      await currentUser?.reauthenticateWithCredential(credential);
      await currentUser?.delete();
      await firebaseAuth.signOut();
    } on FirebaseAuthException catch(ex){
      throw AuthException(ex.message ?? 'Unable to delete account, please try again later.');
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try{
      if(email.isNullOrEmpty()) throw AuthException('Invalid email.');

      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch(ex){
      throw AuthException(ex.message ?? 'Unable to reset password, please try again later.');
    }
  }

  @override
  Future<UserCredential?> signIn(String email, String password) async {
    try{
      if(email.isNullOrEmpty()) throw AuthException('Invalid email.');
      if(password.isNullOrEmpty()) throw AuthException('Invalid password.');

      return await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(ex){
      throw AuthException(ex.message ?? 'Unable to sign in, please try again later.');
    }
  }

  @override
  Future<void> signOut() async {
    try{
      await firebaseAuth.signOut();
    } on FirebaseAuthException catch(ex){
      throw AuthException(ex.message ?? 'Unable to sign out, please try again later.');
    }
  }

  @override
  Future<void> updateUserName(String userName) async {
    try{
      if(userName.isNullOrEmpty()) throw AuthException('Invalid username.');

      await currentUser?.updateDisplayName(userName);
    } on FirebaseAuthException catch(ex){
      throw AuthException(ex.message ?? 'Unable to update username, please try again later.');
    }
  }

}