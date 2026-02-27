import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_authorize_app/features/authentication/auth_provider.dart';

import 'create_account_view_state.dart';

class CreateAccountViewController extends Notifier<CreateAccountViewState>{

  Future<void> createAccount({
    required String email,
    required String password
  }) async {
    try {
      state = state.copyWith(status: CreateAccountStatus.waiting);
      await ref.read(authRepositoryProvider).createAccount(email, password);

      state = state.copyWith(status: CreateAccountStatus.success, authErrorMessage: '');
    } on FirebaseAuthException catch (e){
      state = state.copyWith(authErrorMessage: e.message, status: CreateAccountStatus.failed);
    }
  }

  void toggleShowPasswordText() {
    state = state.copyWith(isShowPasswordText: !state.isShowPasswordText);
  }

  @override
  CreateAccountViewState build() {
    return CreateAccountViewState();
  }

}