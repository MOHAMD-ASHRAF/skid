import 'package:flutter/material.dart';

Column buildIntroText() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 20,
      ),
      Text(
        "Enter phone number",
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 20,
      ),
      Text(
        "mobile number",
        style: TextStyle(fontSize: 15, color: Colors.grey),
      ),
      SizedBox(height: 8,),

    ],
  );
}
