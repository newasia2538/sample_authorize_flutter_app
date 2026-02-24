import 'package:flutter/material.dart';

extension NavigatorNullableExtension on BuildContext? {
  bool canPop() {
    if (this == null) {
      return false;
    }
    return Navigator.canPop(this!);
  }

  void pop<T extends Object?>({T? result}){
    if (this == null) {
      return;
    }

    return Navigator.pop(this!, result);
  }
}