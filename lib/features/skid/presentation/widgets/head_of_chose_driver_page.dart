

import 'package:flutter/material.dart';
import 'package:skid/core/constant/my_color.dart';

Container headOfChoseDriverPage() => Container(
  width: 220,
  height: 53,
  decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(28), color: Colors.grey.shade300),
  child: Center(
      child: RichText(
        text: const TextSpan(children: [
          TextSpan(
              text: '4 bike ',
              style: TextStyle(color: MyColor.green, fontSize: 18)),
          TextSpan(
              text: 'close to you',
              style: TextStyle(color: Colors.black, fontSize: 18))
        ]),
      )),
);