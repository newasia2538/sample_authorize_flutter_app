import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_authorize_app/constant/constants.dart';
import 'package:sample_authorize_app/features/authentication/auth_provider.dart';

class HomeView extends ConsumerStatefulWidget{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();

}

class _HomeViewState extends ConsumerState<HomeView>{

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Home View page',
                style: TextStyle(fontSize: 38),
                textAlign: TextAlign.center,),
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: appColor.primaryContainer,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    'Log out',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.center,

                  ),
                ),
                onTap: _signOut,
              ),
            ],
          ),
      ),
    );
  }

  void _signOut() async {
    await ref.read(authRepositoryProvider).signOut();
    await ref.read(authControlerProvider.notifier).setSignOutState();
    if(mounted) ref.read(appSecureStorageProvider).deleteValueByKey(AppConstant.tokenKey);
  }

}