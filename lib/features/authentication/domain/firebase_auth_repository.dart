import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthRepository{
  Future<UserCredential?> signIn(String email, String password);
  Future<UserCredential?> createAccount(String email, String password);
  Future<void> signOut();
  Future<void> resetPassword(String email);
  Future<void> updateUserName(String userName);
  Future<void> deleteAccount(String email, String password);
  Future<void> changePassword(String email, String password, String newPassword);
}