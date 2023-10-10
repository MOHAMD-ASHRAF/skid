import 'package:flutter/material.dart';
import 'package:skid/core/component/test_widget.dart';
import 'package:skid/core/constant/my_color.dart';

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
            const CircleAvatar(radius: 8,backgroundColor: MyColor.green,),
            const SizedBox(width: 8,),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                height: 135,
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
                    const TextWidget(
                      text: 'Are you Satisfied the job ?',
                      fontSize: 18,
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
                          onTap: (){},
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
        const SizedBox(height: 32,),
        Row(
          children: [
            const CircleAvatar(radius: 8,backgroundColor: MyColor.green,),
            const SizedBox(width: 8,),
            Expanded(
              child: Container(
                  padding: const EdgeInsets.all(12),
                  height: 202,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: MyColor.offWhite),
                  child:  Column(
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.check_circle_outline,color: Colors.green,),
                          SizedBox(width: 8,),
                          TextWidget(text: 'Package has been picked up', fontSize: 18),
                          Spacer(),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: TextWidget(text: '3:30 pm', fontSize: 14,color: Colors.grey,)),
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
        const SizedBox(
          height: 32,
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
                      text: '4:47 pm',
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
                          child: TextWidget(text: '3:30 pm', fontSize: 14,color: Colors.grey,)),
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
                          child: TextWidget(text: '3:05 pm', fontSize: 14,color: Colors.grey,)),
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
                          TextWidget(text: 'Rider has arrived', fontSize: 16),
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
    );
  }
}