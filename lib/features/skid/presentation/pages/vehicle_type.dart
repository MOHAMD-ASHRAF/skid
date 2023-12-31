import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skid/core/component/default_appbar.dart';
import 'package:skid/core/component/default_button.dart';
import 'package:skid/core/component/test_widget.dart';
import 'package:skid/core/constant/my_color.dart';
import 'package:skid/core/constant/string.dart';
import 'package:skid/features/skid/presentation/widgets/delivery_item_model.dart';

class VehicleTypePage extends StatefulWidget {
  const VehicleTypePage({super.key});

  @override
  State<VehicleTypePage> createState() => _VehicleTypePageState();
}

class _VehicleTypePageState extends State<VehicleTypePage> {
  List<DeliveryItemModel> item = [
    DeliveryItemModel('assets/images/bicycle.jpg', 'Bicycle Delivery',
        '16.00\$', '50 min to delivery', false),
    DeliveryItemModel('assets/images/motorbike.jpg', 'Motorbike Delivery',
        '20.00\$', '30 min to delivery', false),
    DeliveryItemModel('assets/images/car_delivery.jpg', 'car Delivery',
        '34.00\$', '20 min to delivery', false),
    DeliveryItemModel('assets/images/van.jpg', 'van Delivery',
        '60.00\$', '20 min to delivery', false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               TextWidget(
                text: 'select a Vehicle Type',
                fontSize: 26.sp,
              ),
               SizedBox(
                height: 24.h,
              ),
              ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, int index) {
                    return buildContainerItem(
                         context,
                         item[index].image,
                         item[index].name,
                         item[index].price,
                         item[index].time,
                         index,
                         item[index].isSelected);
                  },
                  itemCount:item.length, separatorBuilder: (BuildContext context, int index) {return  SizedBox(height: 16.h,); },),
              const SizedBox(
                height: 32,
              ),
              DefaultMaterialButton(
                text: 'done',
                onPressed: () {
                  Navigator.pushNamed(context, choseDriverPage);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContainerItem(
       BuildContext context,
       String image,
       String name,
       String price,
       String time,
       int index,
       bool isSelected ) {
    return GestureDetector(
      onTap: (){
        setState(() {
          item[index].isSelected = !item[index].isSelected;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
       height: 95.h,
        decoration: BoxDecoration(
          border: Border.all(
            width: isSelected ? 1.8 : 1,
            color: isSelected ? Colors.green : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 10,
              backgroundColor: isSelected ? Colors.green : Colors.grey,
            ),
            const SizedBox(
              width: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                image,
                fit: BoxFit.fill,
                width: 110,
                height: MediaQuery.of(context).size.height,
              ),
            ),
            const SizedBox(
              width: 22,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: name,
                  fontSize: 18,
                ),
                TextWidget(
                  text: price,
                  fontSize: 18,
                  color: MyColor.green,
                ),
                TextWidget(
                  text: time,
                  fontSize: 16,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
