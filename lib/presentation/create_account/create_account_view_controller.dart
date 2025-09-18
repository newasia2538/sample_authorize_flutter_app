import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:sample_authorize_app/services/auth_service.dart';

import 'create_account_view_state.dart';

class CreateAccountViewController extends StateNotifier<CreateAccountViewState>{
  CreateAccountViewController() : super(CreateAccountViewState());

  Future<void> createAccount({
    required String email,
    required String password
  }) async {
    try {
      state = state.copyWith(status: CreateAccountStatus.waiting);
      await authService.value.createAccount(email: email, password: password);
      state = state.copyWith(status: CreateAccountStatus.success, authErrorMessage: '');
    } on FirebaseAuthException catch (e){
      state = state.copyWith(authErrorMessage: e.message, status: CreateAccountStatus.failed);
    }
  }

  void toggleShowPasswordText() {
    state = state.copyWith(isShowPasswordText: !state.isShowPasswordText);
  }

}