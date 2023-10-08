
import 'package:flutter/material.dart';
import 'package:skid/core/constant/my_color.dart';

import 'package:skid/features/skid/presentation/widgets/chose_driver_Item.dart';
import 'package:skid/features/skid/presentation/widgets/person_delivery_item_model.dart';

class ChoseDriverPage extends StatefulWidget {
  const ChoseDriverPage({super.key});

  @override
  State<ChoseDriverPage> createState() => _ChoseDriverPageState();
}

class _ChoseDriverPageState extends State<ChoseDriverPage> {


  List<PersonDeliveryItemModel> item = [
    PersonDeliveryItemModel('assets/images/person.jpg','4.8','5','01022953656','Mohamed ashraf'),
    PersonDeliveryItemModel('assets/images/person1.jpg','3.6','7','01022953656','Ahmed yaser'),
    PersonDeliveryItemModel('assets/images/person2.jpg','5.0','10','01022953656','Mostafa ali'),
    PersonDeliveryItemModel('assets/images/person3.jpg','4.6','20','01022953656','abdallah adel'),
  ];
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
            const SizedBox(height: 16,),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) =>  ChoseDriverItem(image: item[index].image, name: item[index].name, time: item[index].time, rate: item[index].rate, phone: item[index].phone,),
                separatorBuilder: (BuildContext context, int index) => const SizedBox(
                  height: 32,
                ),
                itemCount: item.length,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
