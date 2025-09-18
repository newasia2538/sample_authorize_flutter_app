import 'package:flutter/cupertino.dart';
import 'package:sample_authorize_app/presentation/app_loading_view.dart';
import 'package:sample_authorize_app/presentation/home/home_view.dart';
import 'package:sample_authorize_app/presentation/sign_in/sign_in_view.dart';
import 'package:sample_authorize_app/services/auth_service.dart';

class StartPage extends StatelessWidget{
  const StartPage({super.key, this.pageNotConnected});

  final Widget? pageNotConnected;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: authService,
        builder: (context, authService, child) {
          return StreamBuilder(
              stream: authService.authStateChange,
              builder: (context, snapshot) {
                Widget widget;
                if(snapshot.connectionState == ConnectionState.waiting){
                  widget = AppLoadingView();
                }else if (snapshot.hasData){
                  widget = HomeView();
                }else{
                  widget = pageNotConnected ?? SignInView();
                }
                return widget;
              },
          );
        },
    );
  }
  
}