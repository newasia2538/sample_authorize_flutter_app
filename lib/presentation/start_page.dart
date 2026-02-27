import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_authorize_app/data/enum/auth_enum.dart';
import 'package:sample_authorize_app/features/authentication/auth_provider.dart';
import 'package:sample_authorize_app/features/authentication/presentation/sign_in/sign_in_view.dart';
import 'package:sample_authorize_app/features/home/presentation/home/home_view.dart';
import 'package:sample_authorize_app/presentation/app_loading_view.dart';

class StartPage extends ConsumerWidget{
  final Widget? pageNotConnected;
  const StartPage({super.key, this.pageNotConnected});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authenState = ref.watch(authControlerProvider);
    return authenState.when(
        error: (err, stackTrace) => const SignInView(),
        loading: () => AppLoadingView(),
        data: (status){
          switch(status){
            case AuthenticateStatus.authenticated:
              return HomeView();
            case AuthenticateStatus.loading:
              return AppLoadingView();
            case AuthenticateStatus.unknown:
            case AuthenticateStatus.unAuthenticated:
              return SignInView();
          }
        },
    );
  }
}