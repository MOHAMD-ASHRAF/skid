import 'package:flutter/material.dart';
import 'package:skid/core/component/default_appbar.dart';
import 'package:skid/core/component/test_widget.dart';
import 'package:skid/core/constant/my_color.dart';
import 'package:skid/features/skid/presentation/widgets/delivery_item_model.dart';

class VehicleTypePage extends StatefulWidget {
  const VehicleTypePage({super.key});

  @override
  State<VehicleTypePage> createState() => _VehicleTypePageState();
}

class _VehicleTypePageState extends State<VehicleTypePage> {
  List<DeliveryItemModel> item = [
    DeliveryItemModel('assets/images/bicycle.jpg', 'Bicycle Delivery',
        '16.00\$', '60 mins to delivery', false),
    DeliveryItemModel('assets/images/bicycle.jpg', 'Bicycle Delivery',
        '16.00\$', '60 mins to delivery', false),
    DeliveryItemModel('assets/images/bicycle.jpg', 'Bicycle Delivery',
        '16.00\$', '60 mins to delivery', false),
    DeliveryItemModel('assets/images/bicycle.jpg', 'Bicycle Delivery',
        '16.00\$', '60 mins to delivery', false),
  ];
 // bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextWidget(
              text: 'select a Vehile Type',
              fontSize: 32,
            ),
            const SizedBox(
              height: 32,
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
                itemCount:item.length, separatorBuilder: (BuildContext context, int index) {return  SizedBox(height: 32,); },)

          ],
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
        height: 110,
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
                width: 120,
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
