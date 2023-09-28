

import 'package:flutter/material.dart';
import 'package:skid/core/constant/my_color.dart';

// ignore: must_be_immutable
class DefaultTextFormFeild extends StatelessWidget {
  final Function()? onPressed;
  final String? Function(String?)? validator;
   final TextEditingController? controller;
  TextInputType? keyboardType;
  final int maxLine ;
   DefaultTextFormFeild({
    super.key, this.onPressed,  this.maxLine = 1,this.keyboardType, this.validator, this.controller
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLine,
      onTapOutside: (event){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      cursorColor: MyColor.green,
      keyboardType: keyboardType,
      validator: validator,
      onSaved: (value) {
        // phoneNumber = value!;
      },
      decoration:  const InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide:
              BorderSide(color: MyColor.green)),
          focusedBorder: UnderlineInputBorder(
              borderSide:
              BorderSide(color: MyColor.green)),
          filled: true,
        fillColor: MyColor.grey
      ),
    );
  }
}