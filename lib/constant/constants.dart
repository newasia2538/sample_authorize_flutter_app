class AppConstant {
  // Email regex (very standard)
  static RegExp emailRegex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  // Password regex: 6–12 chars, allows letters, numbers, special chars
  static RegExp passwordRegex = RegExp(
    r'^.{6,12}$',
  );
  static String emailAddress = 'Email Address';
  static String password = 'Password';
  static String register = 'Register';
}