enum AuthenticateStatus{
  unknown(0),
  unAuthenticated(1),
  authenticated(2),
  loading(3);

  const AuthenticateStatus(this.value);
  final num value;

  static AuthenticateStatus getStatusByValue(num val){
    return AuthenticateStatus.values.firstWhere((x) => x.value == val, orElse: () => defaultValue);
  }

  static AuthenticateStatus defaultValue = unknown;

}