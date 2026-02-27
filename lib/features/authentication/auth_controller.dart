import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_authorize_app/constant/constants.dart';
import 'package:sample_authorize_app/core/extensions/string_extensions.dart';
import 'package:sample_authorize_app/data/enum/auth_enum.dart';
import 'package:sample_authorize_app/features/authentication/auth_provider.dart';

class AuthController extends AsyncNotifier<AuthenticateStatus>{
  @override
  Future<AuthenticateStatus> build() async {
    state = const AsyncData(AuthenticateStatus.loading);
    return isLoggedIn();
  }

  Future<AuthenticateStatus> isLoggedIn() async {
    final appSecureStorage = ref.read(appSecureStorageProvider);
    final loggedInToken = await appSecureStorage.getValueByKey(AppConstant.tokenKey);

    if(loggedInToken.isNotNullOrEmpty()) {
      state = const AsyncData(AuthenticateStatus.authenticated);
      return AuthenticateStatus.authenticated;
    }

    state = const AsyncData(AuthenticateStatus.unAuthenticated);
    return AuthenticateStatus.unAuthenticated;
    }

  Future<void> setSignInState() async{
    state = const AsyncData(AuthenticateStatus.authenticated);
  }

  Future<void> setSignOutState() async{
    state = const AsyncData(AuthenticateStatus.unAuthenticated);
  }
}