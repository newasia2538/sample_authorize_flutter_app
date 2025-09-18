
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

ValueNotifier<AuthService> authService = ValueNotifier(AuthService());
class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => firebaseAuth.currentUser;
  Stream<User?> get authStateChange => firebaseAuth.authStateChanges();

  Future<UserCredential> signIn({
    required String email,
    required String password
  }) async {
    return await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> createAccount({
    required String email,
    required String password
  }) async {
    return firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  Future<void> resetPassword({required String email}) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> updateUserName({required String userName}) async {
      await currentUser?.updateDisplayName(userName);
  }

  Future<void> deleteAccount({required String email, required String password}) async {
    final credential = EmailAuthProvider.credential(email: email, password: password);
    await currentUser?.reauthenticateWithCredential(credential);
    await currentUser?.delete();
    await firebaseAuth.signOut();
  }

  Future<void> changePassword({required String email, required String password, required String newPassword}) async {
    final credential = EmailAuthProvider.credential(email: email, password: password);
    await currentUser?.reauthenticateWithCredential(credential);
    await currentUser?.updatePassword(newPassword);
  }
}