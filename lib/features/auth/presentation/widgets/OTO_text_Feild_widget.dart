import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPTextFeildWidget extends StatelessWidget {
    OTPTextFeildWidget({Key? key, required this.controller}) : super(key: key);
   final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 58,
      child: TextFormField(
        controller: controller,
        onChanged: (value){
          if(value.length == 1 ){
            FocusScope.of(context).nextFocus();
          }
        },
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 22),
        keyboardType: TextInputType.phone,
        cursorColor: Colors.green,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
