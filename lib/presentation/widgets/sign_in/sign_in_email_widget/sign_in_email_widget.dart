import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_authorize_app/constant/constants.dart';
import 'package:sample_authorize_app/constant/keys.dart';
import 'package:sample_authorize_app/presentation/widgets/sign_in/sign_in_email_widget/sign_in_email_widget_provider.dart';
import 'package:sample_authorize_app/utils/extensions.dart';

class SignInEmailWidget extends ConsumerStatefulWidget {
  const SignInEmailWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SignInEmailWidgetState();
}

class _SignInEmailWidgetState extends ConsumerState<SignInEmailWidget> {
  late TextEditingController emailTextFieldController;
  late TextEditingController passwordTextFieldController;

  @override
  void initState() {
    super.initState();
    emailTextFieldController = TextEditingController();
    passwordTextFieldController = TextEditingController();
  }

  @override
  void dispose() {
    emailTextFieldController.dispose();
    passwordTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isShowPasswordText =
        ref.watch(signInEmailProvider).isShowPasswordText;
    final validateEmailErrorMessage = ref.watch(signInEmailProvider).errorEmailAddressMessage;
    final validatePasswordErrorMessage = ref.watch(signInEmailProvider).errorPasswordMessage;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppConstant.emailAddress,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.left,
        ),
        TextField(
          key: emailAddressTextFieldKey,
          controller: emailTextFieldController,
          decoration: InputDecoration(
            hintText: 'Enter your email.',
            errorText: validateEmailErrorMessage,
          ),
          onTapOutside: (value) {
            if(validateEmailErrorMessage.isNullOrEmpty()) {
              emailTextFieldController.clear();
            }
          },
        ),
        const SizedBox(height: 16),
        Text(
          AppConstant.password,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.left,
        ),
        TextField(
          key: passwordTextFieldKey,
          controller: passwordTextFieldController,
          keyboardType: TextInputType.visiblePassword,
          obscureText: !isShowPasswordText,
          decoration: InputDecoration(
            hintText: 'Enter your password.',
            errorText: validatePasswordErrorMessage,
            suffixIcon: IconButton(
              onPressed: () {
                ref.read(signInEmailProvider.notifier).toggleShowPasswordText();
              },
              icon:
                  isShowPasswordText
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
            ),
          ),
          onTapOutside: (value) {
            if(validatePasswordErrorMessage.isNullOrEmpty()) {
              passwordTextFieldController.clear();
            }
          },
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () {
            ref.read(signInEmailProvider.notifier).validateEmail(emailTextFieldController.value.text);
            ref.read(signInEmailProvider.notifier).validatePassword(passwordTextFieldController.value.text);
            if(validatePasswordErrorMessage.isNullOrEmpty() && validateEmailErrorMessage.isNullOrEmpty()){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logged in success !!!')),
              );
              passwordTextFieldController.clear();
              emailTextFieldController.clear();
            }
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(32),),
              color: Colors.black,
            ),
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
