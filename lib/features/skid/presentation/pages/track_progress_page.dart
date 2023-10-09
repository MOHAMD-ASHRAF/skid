import 'package:flutter/material.dart';
import 'package:skid/core/component/default_appbar.dart';
import 'package:skid/core/constant/my_color.dart';
import 'package:skid/features/skid/presentation/widgets/person_delivery_item_model.dart';
import '../../../../core/component/test_widget.dart';

class TrackProgressPage extends StatelessWidget {
  const TrackProgressPage({super.key, required this.item});
   final PersonDeliveryItemModel item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _buildContainer(),
            const SizedBox(
              height: 16,
            ),
            const TextWidget(
              text: 'Track Progress',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
                width: 113,
                child: Divider(
                  color: MyColor.darkGreen,
                  thickness: 1.8,
                )),
            const SizedBox(
              height: 16,
            ),
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
                    child: const Center(
                      child: ListTile(
                        leading: TextWidget(
                          text: 'Delivery in progress',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        trailing: TextWidget(
                          text: '2:47pm',
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
                height: 32,),
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
                    child: const Row(
                      children: [
                        Icon(Icons.check_circle_outline,color: Colors.green,),
                        SizedBox(width: 8,),
                        TextWidget(text: 'Package has been picked up', fontSize: 18),
                        Spacer(),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: TextWidget(text: '3:00 pm', fontSize: 14,color: Colors.grey,)),
                      ],
                    )
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 32,),
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
                      child: const Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(text: 'Invoice Generated', fontSize: 18,fontWeight: FontWeight.bold,),
                              TextWidget(text: 'Call Out charge will be refunded ', fontSize: 16),
                              TextWidget(text: 'acceptance  ', fontSize: 16),
                            ],
                          ),
                          Spacer(),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: TextWidget(text: '3:00 pm', fontSize: 14,color: Colors.grey,)),
                        ],
                      )
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 32,),
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
                      child: const Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(text: 'Rider has Arrived at the location', fontSize: 18,fontWeight: FontWeight.bold,),
                              SizedBox(
                                height: 18,
                              ),
                              TextWidget(text: 'Rider has arrived   ', fontSize: 16),
                            ],
                          ),
                          Spacer(),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: TextWidget(text: '3:00 pm', fontSize: 14,color: Colors.grey,)),
                        ],
                      )
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container _buildContainer() {
    return Container(
      height: 110,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32), topRight: Radius.circular(32)),
          color: Colors.black),
      child:  Center(
        child: ListTile(
          leading:  CircleAvatar(
            radius: 30,
            backgroundColor: MyColor.green,
            child: CircleAvatar(
              radius: 26,
              backgroundImage: AssetImage(item.image),
            ),
          ),
          title: TextWidget(
            text: item.name,
            fontSize: 16,
            color: Colors.white,
          ),
          subtitle:  Row(
            children: [
              TextWidget(
                text: item.rate,
                fontSize: 12,
                color: Colors.white,
              ),
              const Icon(
                Icons.star,
                color: Colors.yellow,
                size: 18,
              )
            ],
          ),

          trailing:  TextWidget(
            text: "${item.time} Mins away",
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
