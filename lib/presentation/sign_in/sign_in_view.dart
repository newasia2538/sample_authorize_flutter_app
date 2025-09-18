import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_authorize_app/configurations/route_path.dart';
import 'package:sample_authorize_app/presentation/widgets/sign_in/authorize_social_widget.dart';
import 'package:sample_authorize_app/presentation/widgets/sign_in/sign_in_email_widget/sign_in_email_widget.dart';

class SignInView extends ConsumerStatefulWidget {
  const SignInView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInViewState();
}

class _SignInViewState extends ConsumerState<SignInView> {
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
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: appColor.secondary),
          ),
          Text(
            'Welcome',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400, color: Colors.grey),
          ),
          const SizedBox(height: 36),
          SignInEmailWidget(),
          const SizedBox(height: 16),
          GestureDetector(
            child: Text(
              'Forgotten your password ?',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 12),
            ),
            onTap: (){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Forgotten password !!!')),
              );
            },
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Divider(color: Colors.black, height: 20, thickness: 1)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: const Text('Or log in with', style: TextStyle(color: Colors.grey, fontSize: 12)),
              ),
              Expanded(child: Divider(color: Colors.black, height: 40, thickness: 1)),
            ],
          ),
          const SizedBox(height: 32,),
          AuthorizeSocialWidget(),
          const SizedBox(height: 24,),
          Text('Don\'t have an account ?', style: TextStyle(color: Colors.grey, fontSize: 12,),),
          GestureDetector(
            child: Text(
              'Create an Account',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            onTap: (){
                Navigator.pushNamed(context, RoutePath.createAccount);
            },
          ),
        ],
      ),
    );
  }
}
