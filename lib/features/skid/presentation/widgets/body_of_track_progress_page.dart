import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:skid/core/component/test_widget.dart';
import 'package:skid/core/constant/my_color.dart';
import 'package:skid/core/constant/string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class BodyOfTrackProgressPage extends StatelessWidget {
  const BodyOfTrackProgressPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
         TextWidget(
          text: 'Track Progress',
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),

        const SizedBox(
            width: 113,
            child: Divider(
              color: MyColor.darkGreen,
              thickness: 1.8,
            )),
         SizedBox(
          height: 8.h,
        ),
        Row(
          children: [
            const CircleAvatar(radius: 8,backgroundColor: MyColor.green,),
            const SizedBox(width: 8,),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                height: 100.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                      colors: [
                        Color(0xff54B541),
                        Color(0xFF00A86B),
                      ],
                      begin: FractionalOffset(0.0, 0.0),
                      end: FractionalOffset(1.0, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     TextWidget(
                      text: 'Are you Satisfied the job ?',
                      fontSize: 18.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){},
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: 123,
                            height: 46,
                            child: const Center(
                                child: TextWidget(
                                  text: 'I am not',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        const SizedBox(width: 16,),
                        GestureDetector(
                          onTap: (){
                            QuickAlert.show(
                              confirmBtnColor: MyColor.darkGreen,
                              confirmBtnText: 'order',
                              onConfirmBtnTap: (){
                                Navigator.pushReplacementNamed(context, homePage);
                              },
                              title: 'That great',
                              context: context,
                              type: QuickAlertType.confirm,
                              text: 'Are you need send  something else!',
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 1, color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: 123,
                            height: 46,
                            child: const Center(
                                child: TextWidget(
                                  text: 'Yes I am',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
         SizedBox(height: 12.h,),
        Row(
          children: [
            const CircleAvatar(radius: 8,backgroundColor: MyColor.green,),
            const SizedBox(width: 8,),
            Expanded(
              child: Container(
                  padding: const EdgeInsets.all(12),
                  height: 160.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: MyColor.offWhite),
                  child:  Column(
                    children: [
                       Row(
                        children: [
                          const Icon(Icons.check_circle_outline,color: Colors.green,),
                          const SizedBox(width: 8,),
                          TextWidget(text: 'Package has been picked up', fontSize: 16.sp),
                          const Spacer(),
                           Align(
                              alignment: Alignment.bottomRight,
                              child: TextWidget(text: '3:30 pm', fontSize: 12.sp,color: Colors.grey,)),
                        ],
                      ),
                      const SizedBox(height: 8,),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset('assets/images/package_in_door.webp',
                          fit: BoxFit.fill,
                          width: 325,
                          height: 127,
                        ),
                      )
                    ],
                  )
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h,),
        Row(
          children: [
            const CircleAvatar(radius: 8,backgroundColor: MyColor.offWhite,),
            const SizedBox(width: 8,),
            Expanded(
              child: Container(
                height: 64,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: MyColor.offWhite),
                child:  Center(
                  child: ListTile(
                    leading: TextWidget(
                      text: 'Delivery in progress',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    trailing: TextWidget(
                      text: '4:47 pm',
                      fontSize: 12.sp,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h,),
        Row(
          children: [
            const CircleAvatar(radius: 8,backgroundColor: MyColor.offWhite,),
            const SizedBox(width: 8,),
            Expanded(
              child: Container(
                  padding: const EdgeInsets.all(12),
                  height: 94,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: MyColor.offWhite),
                  child:  Row(
                    children: [
                      const Icon(Icons.check_circle_outline,color: Colors.green,),
                      const SizedBox(width: 8,),
                      TextWidget(text: 'Package has been picked up', fontSize: 16.sp),
                      const Spacer(),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: TextWidget(text: '3:30 pm', fontSize: 12.sp,color: Colors.grey,)),
                    ],
                  )
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h,),
        Row(
          children: [
            const CircleAvatar(radius: 8,backgroundColor: MyColor.offWhite,),
            const SizedBox(width: 8,),
            Expanded(
              child: Container(
                  padding: const EdgeInsets.all(12),
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: MyColor.offWhite),
                  child:  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(text: 'Invoice Generated', fontSize: 16.sp,fontWeight: FontWeight.bold,),
                          TextWidget(text: 'Call Out charge will be refunded ', fontSize: 14.sp),
                          TextWidget(text: 'acceptance  ', fontSize: 14.sp),
                        ],
                      ),
                      const Spacer(),
                      const Align(
                          alignment: Alignment.bottomRight,
                          child: TextWidget(text: '3:05 pm', fontSize: 14,color: Colors.grey,)),
                    ],
                  )
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h,),
        Row(
          children: [
            const CircleAvatar(radius: 8,backgroundColor: MyColor.offWhite,),
            const SizedBox(width: 8,),
            Expanded(
              child: Container(
                  padding: const EdgeInsets.all(12),
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: MyColor.offWhite),
                  child:  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(text: 'Rider has Arrived at the location', fontSize: 16.sp,fontWeight: FontWeight.bold,),
                          const SizedBox(
                            height: 18,
                          ),
                          TextWidget(text: 'Rider has arrived', fontSize: 14.sp),
                        ],
                      ),
                      const Spacer(),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: TextWidget(text: '3:00 pm', fontSize: 12.sp,color: Colors.grey,)),
                    ],
                  )
              ),
            ),
          ],
        )
      ],
    );
  }
}