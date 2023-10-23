import 'package:flutter/material.dart';


void showProgressIndicator(BuildContext context) {
  AlertDialog alertDialog = const AlertDialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      ),
    ),
  );
  showDialog(
      context: context,
      barrierColor: Colors.white.withOpacity(0),
      barrierDismissible: false,
      builder: (context) {
        return alertDialog;
      });
}
