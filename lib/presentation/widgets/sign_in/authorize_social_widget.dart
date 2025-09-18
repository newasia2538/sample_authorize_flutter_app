import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthorizeSocialWidget extends ConsumerStatefulWidget {
  const AuthorizeSocialWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthorizeSocialWidgetState();

}

class _AuthorizeSocialWidgetState extends ConsumerState<AuthorizeSocialWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _generateSocialButton('assets/images/logos/google.svg', _authorizeGoogle),
        _generateSocialButton('assets/images/logos/facebook.svg', _authorizeFacebook),
        _generateSocialButton('assets/images/logos/apple.svg', _authorizeApple),
      ],
    );
  }

  Widget _generateSocialButton(String iconPath, Function() callBack) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(strokeAlign: BorderSide.strokeAlignOutside),
          borderRadius: BorderRadius.circular(50),
        ),
        child: InkWell(child: SvgPicture.asset(
          iconPath, alignment: Alignment.center, width: 32, height: 32,),),
      ),
      onTap: callBack,
    );
  }

  void _authorizeGoogle() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Google logged in !!!')),
    );
  }

  void _authorizeFacebook() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Facebook logged in !!!')),
    );
  }

  void _authorizeApple() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Apple logged in !!!')),
    );
  }
}
