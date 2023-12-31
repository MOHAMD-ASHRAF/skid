import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skid/core/component/test_widget.dart';
import 'package:skid/core/constant/my_color.dart';
import 'package:url_launcher/url_launcher.dart';

class ChoseDriverItem extends StatelessWidget {
  const ChoseDriverItem({
    super.key, required this.image, required this.name, required this.time, required this.rate, required this.phone, required this.onTap,
  });
  final String image;
  final String name;
  final String time;
  final String rate;
  final String phone;
  final void Function() onTap;


  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }




  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 220.h,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.green),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            height: 110,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(9),
                    topRight: Radius.circular(9)),
                color: Colors.black),
            child:  Center(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: MyColor.green,
                  child: CircleAvatar(
                    radius: 26,
                    backgroundImage: AssetImage(image),
                  ),
                ),
                title: TextWidget(
                  text: name,
                  fontSize: 16.sp,
                  color: Colors.white,
                ),
                subtitle: Row(
                  children: [
                    TextWidget(
                      text: rate,
                      fontSize: 12.sp,
                      color: Colors.white,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 18,
                    )
                  ],
                ),
                trailing: TextWidget(
                  text: '$time mins away',
                  fontSize: 12.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          ListTile(
            title:  TextWidget(
              text: 'status',
              fontSize: 18.sp,
            ),
            subtitle:  TextWidget(
              text: 'Finding a Rider for you...',
              fontSize: 16.sp,
              color: MyColor.darkGreen,
              fontWeight: FontWeight.bold,
            ),
            trailing: GestureDetector(
             onTap: () {
               _makePhoneCall('01022953656');
             },
              child: Image.asset(
                'assets/images/phoneIcon.png',
                width: 46,
                height: 46,
              ),
            ),
          ),
          ListTile(
            title:  TextWidget(
              text: 'Cancel',
              fontSize: 15.sp,
              color: MyColor.darkGreen,
            ),
            trailing: GestureDetector(
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 123,
                height: 46,
                child:  Center(
                    child: TextWidget(
                      text: 'view progress',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}