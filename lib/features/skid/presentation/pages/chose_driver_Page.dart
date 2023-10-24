import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skid/core/component/default_appbar.dart';
import 'package:skid/core/component/test_widget.dart';
import 'package:skid/core/constant/my_color.dart';
import 'package:skid/core/constant/string.dart';

import 'package:skid/features/skid/presentation/widgets/chose_driver_Item.dart';
import 'package:skid/features/skid/presentation/widgets/head_of_chose_driver_page.dart';
import 'package:skid/features/skid/presentation/widgets/person_delivery_item_model.dart';

class ChoseDriverPage extends StatefulWidget {
  const ChoseDriverPage({super.key});

  @override
  State<ChoseDriverPage> createState() => _ChoseDriverPageState();
}

class _ChoseDriverPageState extends State<ChoseDriverPage> {
  List<PersonDeliveryItemModel> item = [
    PersonDeliveryItemModel('assets/images/person.jpg', '4.8', '5',
        '01022953656', 'Mohamed ashraf'),
    PersonDeliveryItemModel(
        'assets/images/person1.jpg', '3.6', '7', '01022953656', 'Ahmed yaser'),
    PersonDeliveryItemModel(
        'assets/images/person2.jpg', '5.0', '10', '01022953656', 'Mostafa ali'),
    PersonDeliveryItemModel('assets/images/person3.jpg', '4.6', '20',
        '01022953656', 'abdallah adel'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: defaultAppBar(context),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              headOfChoseDriverPage(),
              const TextWidget(
                text: 'chose one',
                fontSize: 18,
                color: MyColor.green,
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => ChoseDriverItem(
                      image: item[index].image,
                      name: item[index].name,
                      time: item[index].time,
                      rate: item[index].rate,
                      phone: item[index].phone,
                      onTap: () {
                        Navigator.pushNamed(context, trackProgressPage,
                            arguments: item[index]);
                      }),
                  separatorBuilder: (BuildContext context, int index) =>
                       SizedBox(
                    height: 18.h,
                  ),
                  itemCount: item.length,
                ),
              ),
            ],
          ),
        ));
  }
}
