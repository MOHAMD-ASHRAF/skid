import 'package:flutter/material.dart';
import 'package:skid/core/component/test_widget.dart';

// ignore: must_be_immutable
class HomeItem extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  void Function()? onTap;
   HomeItem({
    super.key, required this.image, required this.title, required this.subTitle,this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration:  BoxDecoration(
          border: Border.all(width: 1 , color: Colors.green),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image,width: 100,height: 100,),
            const SizedBox(height: 10,),
            TextWidget(text: title, fontSize: 22,fontWeight: FontWeight.bold,),
            TextWidget(text:  subTitle,
              fontSize: 12,color: Colors.green,),
          ],
        ),
      ),
    );
  }
}