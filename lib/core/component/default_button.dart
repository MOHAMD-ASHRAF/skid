import 'package:flutter/material.dart';


class defaultMaterialButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final double width ;
   const defaultMaterialButton({Key? key, required this.text, this.onPressed,this.width = double.infinity}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width,
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(10)),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(text,style: const TextStyle(color: Colors.white, fontSize: 22),),
      ),
    );
  }
}
