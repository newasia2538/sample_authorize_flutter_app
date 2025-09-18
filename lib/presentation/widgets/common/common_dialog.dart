import 'package:flutter/material.dart';

class CommonDialog {
  final String? headerTitle;
  final String? subTitle;
  final String? rightTitle;
  final String? leftTitle;
  final String? centerTitle;
  final VoidCallback? callBack;

  CommonDialog({this.headerTitle, this.subTitle, this.rightTitle, this.leftTitle, this.centerTitle, this.callBack});


  void alertDialog(BuildContext context, {VoidCallback? callCancel}){
    Dialog dialog = Dialog(
      shadowColor: Colors.transparent,
      child: _defualtDialog(context),
    );
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return WillPopScope(onWillPop: () async => false, child: dialog);
        }).then((value) {
      if (callBack != null) {
        callBack?.call();
      } else {
        callCancel?.call();
      }
    });
  }

  Widget _defualtDialog(BuildContext? context){
    return Dialog(child:
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(headerTitle ?? ''),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
               if(context != null) Navigator.of(context).pop();
            },
            child: Text(rightTitle ?? 'Close'),
          ),
        ],
      ),
    ),);
  }

}