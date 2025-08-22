import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_authorize_app/presentation/widgets/sign_in/authorize_social_widget.dart';
import 'package:sample_authorize_app/presentation/widgets/sign_in/sign_in_email_widget/sign_in_email_widget.dart';

class SigninView extends ConsumerStatefulWidget {
  const SigninView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SigninViewState();
}

class _SigninViewState extends ConsumerState<SigninView> {
  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Login',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: appColor.secondary,
            ),
          ),
          Text(
            'Welcome',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 52),
          SignInEmailWidget(),
          AuthorizeSocialWidget(),
        ],
      ),
    );
  }
}
