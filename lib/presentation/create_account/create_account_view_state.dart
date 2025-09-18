
class CreateAccountViewState {
  final String? emailAddress;
  final String? password;
  final String? errorEmailAddressMessage;
  final String? errorPasswordMessage;
  final String? authErrorMessage;
  final bool isShowPasswordText;
  CreateAccountStatus? status = CreateAccountStatus.initial;

  CreateAccountViewState({this.emailAddress, this.password, this.errorEmailAddressMessage, this.errorPasswordMessage, this.authErrorMessage, this.status, this.isShowPasswordText = false,});

  CreateAccountViewState copyWith({String? emailAddress, String? password, String? errorEmailAddressMessage, String? errorPasswordMessage, String? authErrorMessage, bool? isShowPasswordText, CreateAccountStatus? status, }) =>
      CreateAccountViewState(
        emailAddress: emailAddress ?? this.emailAddress,
        password: password ?? this.password,
        errorEmailAddressMessage: errorEmailAddressMessage ?? this.errorEmailAddressMessage,
        errorPasswordMessage:  errorPasswordMessage ?? this.errorPasswordMessage,
        authErrorMessage: authErrorMessage ?? this.authErrorMessage,
        isShowPasswordText:  isShowPasswordText ?? this.isShowPasswordText,
        status: status ?? this.status,
      );
}

enum CreateAccountStatus {
  initial,
  waiting,
  success,
  failed,
}