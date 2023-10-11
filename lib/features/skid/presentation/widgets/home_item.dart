import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            Image.asset(image,width: 85.w,height: 85.h,),
             SizedBox(height: 10.h,),
            TextWidget(text: title, fontSize: 20.sp,fontWeight: FontWeight.bold,),
            TextWidget(text:  subTitle,
              fontSize: 12.sp,color: Colors.green,),
          ],
        ),
      ),
    );
  }
}