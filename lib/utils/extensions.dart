import 'package:flutter/material.dart';

extension StringExtensions on String?{
  bool isNullOrEmpty(){
    return this == null || this!.isEmpty;
  }

  bool isNotNullOrEmpty(){
    return !isNullOrEmpty();
  }
}

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