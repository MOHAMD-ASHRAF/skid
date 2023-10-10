

import 'package:flutter/material.dart';
import 'package:skid/core/constant/my_color.dart';

// ignore: must_be_immutable
class DefaultTextFormFeild extends StatelessWidget {
  final Function()? onPressed;
  final String? Function(String?)? validator;
   final TextEditingController? controller;
  TextInputType? keyboardType;
  final int maxLine ;
  final int maxLength ;
   DefaultTextFormFeild({
    super.key, this.onPressed,  this.maxLine = 1,this.keyboardType, this.validator, this.controller,  this.maxLength = 100
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      maxLength: maxLength,
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