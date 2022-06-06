import 'package:flutter/material.dart';

class TheSnackBar {
  final BuildContext context;
  final String errorMessage;
  final Color messageColor;

  TheSnackBar(this.context, this.errorMessage, this.messageColor){
    snackBar(context, errorMessage, messageColor);
  }
  //هاد تابع لل SnackBar بيعرض رسالة الخطأ او رسالة ال اتمام العملية
  void snackBar(
      BuildContext context, String errorMessage, Color snackBarColor) {
    final snackBar = SnackBar(
      content: Text(
        errorMessage,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      backgroundColor: snackBarColor,
      duration: const Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
