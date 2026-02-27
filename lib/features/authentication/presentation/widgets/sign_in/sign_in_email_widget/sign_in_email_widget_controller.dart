import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_authorize_app/constant/constants.dart';
import 'package:sample_authorize_app/core/extensions/string_extensions.dart';
import 'package:sample_authorize_app/features/authentication/auth_provider.dart';
import 'package:sample_authorize_app/features/authentication/presentation/widgets/sign_in/sign_in_email_widget/sign_in_email_widget_state.dart';

class SignInEmailWidgetController extends Notifier<SignInEmailWidgetState> {

  @override
  SignInEmailWidgetState build(){
    return SignInEmailWidgetState();
  }

  void validateEmail(String email) {
    String? errorMessage = '';
    if (email.isNullOrEmpty()) {
      errorMessage = 'Please enter your email.';
    }else if (!AppConstant.emailRegex.hasMatch(email)) {
      errorMessage = 'Your email is valid.';
    }

    state = state.copyWith(errorEmailAddressMessage: errorMessage);
  }

  void validatePassword(String password) {
    String? errorMessage = '';
    if (password.isNullOrEmpty()) {
      errorMessage = "Password is required";
    } else if (!AppConstant.passwordRegex.hasMatch(password)) {
      errorMessage = "Password must be 6–12 characters";
    }

    state = state.copyWith(errorPasswordMessage: errorMessage);
  }

  void toggleShowPasswordText(){
    state = state.copyWith(isShowPasswordText: !state.isShowPasswordText);
  }

  Future<String?> signIn(String email, String password) async {
    try{
      final signInResult = await ref.read(authRepositoryProvider).signIn(email, password);
      if(signInResult?.user != null){
        print('User signed in:');
        print('User ID: ${signInResult?.user?.uid}');
        print('User Email: ${signInResult?.user?.email}');
        print('Display Name: ${signInResult?.user?.displayName}');
        print('Email Verified: ${signInResult?.user?.emailVerified}');
        print('Is New User: ${signInResult?.additionalUserInfo?.isNewUser}');
        print('Provider ID: ${signInResult?.credential?.providerId}');

        final idToken = await signInResult?.user?.getIdToken() ?? '';
        ref.read(appSecureStorageProvider).saveValueByKey(AppConstant.tokenKey, idToken);
        ref.read(authControlerProvider.notifier).isLoggedIn();
        return idToken;
      }
    } on FirebaseAuthException catch(e){
      print('signIn error : ${e.message}');
      return null;
    }
    return null;
  }
}
