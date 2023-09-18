

import 'package:flutter/material.dart';
import 'package:skid/core/constant/my_color.dart';

class DefaultTextFormFeild extends StatelessWidget {
  final Function()? onPressed;
  TextInputType? keyboardType;
  final int maxLine ;
   DefaultTextFormFeild({
    super.key, this.onPressed,  this.maxLine = 1,this.keyboardType
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLine,
      onTapOutside: (event){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      cursorColor: MyColor.green,
      keyboardType: keyboardType,
      validator: (value) {
        if (value!.isEmpty) {
          return "enter the Quantity";
        }
        return null;
      },
      onSaved: (value) {
        // phoneNumber = value!;
      },
      decoration: const InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide:
              BorderSide(color: MyColor.green)),
          focusedBorder: UnderlineInputBorder(
              borderSide:
              BorderSide(color: MyColor.green)),
          filled: true
      ),
    );
  }
}