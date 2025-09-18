import 'package:flutter_riverpod/legacy.dart';
import 'package:sample_authorize_app/constant/constants.dart';
import 'package:sample_authorize_app/presentation/widgets/sign_in/sign_in_email_widget/sign_in_email_widget_state.dart';
import 'package:sample_authorize_app/utils/extensions.dart';

class SignInEmailWidgetController extends StateNotifier<SignInEmailWidgetState> {
  SignInEmailWidgetController() : super(SignInEmailWidgetState());

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
}
