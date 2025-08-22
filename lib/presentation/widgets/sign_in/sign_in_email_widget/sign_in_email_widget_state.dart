class SignInEmailWidgetState {
  final String? emailAddress;
  final String? password;
  final String? errorEmailAddressMessage;
  final String? errorPasswordMessage;
  final bool isShowPasswordText;

  SignInEmailWidgetState({this.emailAddress, this.password, this.errorEmailAddressMessage, this.errorPasswordMessage, this.isShowPasswordText = false});

  SignInEmailWidgetState copyWith({String? emailAddress, String? password, String? errorEmailAddressMessage, String? errorPasswordMessage, bool? isShowPasswordText}) =>
      SignInEmailWidgetState(
        emailAddress: emailAddress ?? this.emailAddress,
        password: password ?? this.password,
        errorEmailAddressMessage: errorEmailAddressMessage ?? this.errorEmailAddressMessage,
        errorPasswordMessage:  errorPasswordMessage ?? this.errorPasswordMessage,
        isShowPasswordText:  isShowPasswordText ?? this.isShowPasswordText,
      );
}
