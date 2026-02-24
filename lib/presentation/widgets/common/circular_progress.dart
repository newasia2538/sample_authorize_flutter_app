import 'package:flutter/material.dart';
import 'package:sample_authorize_app/core/extensions/extensions.dart';

final GlobalKey progressDialog = GlobalKey<NavigatorState>();

class CircularProgress extends StatelessWidget{
  const CircularProgress({super.key});

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context).colorScheme;
    return SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(
        color: appColor.primary,
      ),
    );
  }

}

showProgress(BuildContext context) async {
  await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (mContext) {
        return PopScope(
          child: Center(
            key: progressDialog,
            child: CircularProgress(),
          ),
        );
      });
}

bool _defaultShouldAllowPop() => true;

hideProgress({
  Duration duration = const Duration(milliseconds: 300),
  bool Function() shouldAllowPop = _defaultShouldAllowPop,
}) async {
  await Future.delayed(duration).then((value) {
    if (progressDialog.currentContext != null &&
        progressDialog.currentContext.canPop() &&
        shouldAllowPop()) {
      progressDialog.currentContext.pop();
    }
  });
}