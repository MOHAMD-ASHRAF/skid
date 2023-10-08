import 'package:flutter/material.dart';
import 'package:skid/core/component/test_widget.dart';
import 'package:skid/core/constant/my_color.dart';

import 'package:skid/features/skid/presentation/widgets/chose_driver_Item.dart';

class ChoseDriverPage extends StatelessWidget {
  const ChoseDriverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding:  const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: 220,
              height: 53,
              decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: Colors.grey.shade300),
              child: Center(child: RichText(text: const TextSpan(
                children: [
                 TextSpan(text: '4 bike ',style: TextStyle(color: MyColor.green,fontSize: 18)),
                  TextSpan(text: 'close to you',style: TextStyle(color:Colors.black,fontSize: 18))
                ]
              ),
                
              )),
            ),
            SizedBox(height: 16,),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => const ChoseDriverItem(),
                separatorBuilder: (BuildContext context, int index) => const SizedBox(
                  height: 32,
                ),
                itemCount: 4,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
