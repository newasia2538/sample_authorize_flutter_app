import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_authorize_app/configurations/route_path.dart';
import 'package:sample_authorize_app/constant/constants.dart';
import 'package:sample_authorize_app/presentation/create_account/create_account_view_controller.dart';
import 'package:sample_authorize_app/presentation/create_account/create_account_view_provider.dart';
import 'package:sample_authorize_app/presentation/widgets/common/circular_progress.dart';
import 'package:sample_authorize_app/presentation/widgets/common/common_dialog.dart';
import 'package:sample_authorize_app/utils/extensions.dart';

import '../../constant/keys.dart';
import 'create_account_view_state.dart';

class CreateAccountView extends ConsumerStatefulWidget{

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateAccountState();
}

class _CreateAccountState extends ConsumerState<CreateAccountView>{
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
    _handleState();
    final appColor = Theme.of(context).colorScheme;
    final isShowPasswordText = ref.watch(createAccountViewProvider).isShowPasswordText;
    final authErrorMessage = ref.read(createAccountViewProvider).authErrorMessage;
    return Scaffold(
      body: SafeArea(
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 48),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppConstant.register,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500, color: appColor.secondary),
              ),
              const SizedBox(height: 48,),
              Column(
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
                    ),
                  ),
                  const SizedBox(height: 24),
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
                      suffixIcon: IconButton(
                        onPressed: () {
                          ref.read(createAccountViewProvider.notifier).toggleShowPasswordText();
                        },
                        icon:
                        isShowPasswordText
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    authErrorMessage ?? '',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.red),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              GestureDetector(
                onTap: () async {
                  await ref.read(createAccountViewProvider.notifier).createAccount(email: emailTextFieldController.text, password: passwordTextFieldController.text);
                  passwordTextFieldController.clear();
                  emailTextFieldController.clear();
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(32),),
                    color: Colors.black,
                  ),
                  child: Text(
                    AppConstant.register,
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
          ),),
      ),
    );
  }

  void _handleState() {
    final authErrorMessage = ref.read(createAccountViewProvider).authErrorMessage;
    ref.listen(createAccountViewProvider, (previous, next) async {
      if (previous?.status == next.status) return;

      switch (next.status) {
        case CreateAccountStatus.waiting:
          showProgress(context);
          break;
        case CreateAccountStatus.success:
          await hideProgress();
          CommonDialog(
            headerTitle:  authErrorMessage.isNullOrEmpty() ? 'Registered a new account' : authErrorMessage,
            callBack: (){
              Navigator.of(context).pushReplacementNamed(RoutePath.signIn);
            }
          ).alertDialog(context);
          break;
        case CreateAccountStatus.failed:
          await hideProgress();
          break;
        default:
          break;
      }
    });
  }

}