import 'package:flutter/material.dart';
import 'package:skid/core/component/test_widget.dart';
import 'package:skid/core/constant/string.dart';

AppBar defaultAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    leading: GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child:  const Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.arrow_back,color: Colors.green,),
          TextWidget(text: 'Back', fontSize: 14),
        ],
      ),
    ),
    actions: [
      GestureDetector(
          onTap: (){
            Navigator.pushReplacementNamed(context, homePage);
          },
          child: const TextWidget(text: 'Cansel Order', fontSize: 14,fontWeight: FontWeight.bold,)),
      const SizedBox(width:16,),
    ],
  );
}