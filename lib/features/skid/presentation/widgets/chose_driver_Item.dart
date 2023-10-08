
import 'package:flutter/material.dart';
import 'package:skid/core/component/test_widget.dart';
import 'package:skid/core/constant/my_color.dart';

class ChoseDriverItem extends StatelessWidget {
  const ChoseDriverItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
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
            child: const Center(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: MyColor.green,
                  child: CircleAvatar(
                    radius: 26,
                    backgroundImage: AssetImage('assets/images/person.jpg'),
                  ),
                ),
                title: TextWidget(
                  text: 'mohamed Ashraf',
                  fontSize: 16,
                  color: Colors.white,
                ),
                subtitle: Row(
                  children: [
                    TextWidget(
                      text: '4.8',
                      fontSize: 12,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 18,
                    )
                  ],
                ),
                trailing: TextWidget(
                  text: '5 mins away',
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          ListTile(
            title: const TextWidget(
              text: 'status',
              fontSize: 18,
            ),
            subtitle: const TextWidget(
              text: 'Finding a Rider for you...',
              fontSize: 16,
              color: MyColor.darkGreen,
              fontWeight: FontWeight.bold,
            ),
            trailing: Image.asset(
              'assets/images/phoneIcon.png',
              width: 46,
              height: 46,
            ),
          ),
          ListTile(
            title: const TextWidget(
              text: 'Cancel',
              fontSize: 15,
              color: MyColor.darkGreen,
            ),
            trailing: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              width: 123,
              height: 46,
              child: const Center(
                  child: TextWidget(
                    text: 'view progress',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          )
        ],
      ),
    );
  }
}