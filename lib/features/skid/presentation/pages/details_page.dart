
import 'package:flutter/material.dart';
import 'package:skid/core/component/default_appbar.dart';
import 'package:skid/core/component/test_widget.dart';
import 'package:skid/core/constant/my_color.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final List<String> items = [
    'less than 1 m',
    '1 m',
    '2 m',
    '3 m',
    '4 m',
    '5 m',
    '6 m',
    'more than 6 m',

  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextWidget(
              text: 'Provide more details about your parcel',
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(child: TextWidget(text: 'Height of Package', fontSize: 18)),
            const SizedBox(
              height: 10,
            ),
            DropdownButton2(
                buttonStyleData: ButtonStyleData(
                  height: 50,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      width: 1.5,
                      color:  MyColor.green
                    ),
                    color: MyColor.grey,
                  ),
                ),
                isExpanded: true,
                hint: const Row(
                  children: [
                    Icon(
                      Icons.list,
                      size: 16,
                      color: Colors.black
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        'height in meter',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                items: items
                    .map((String item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.green
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                ).toList(),
                value: selectedValue,
                onChanged: (String? value) {
                  setState(() {
                    selectedValue = value;

                  });
                }
                ),
          ],
        ),
      )),
    );
  }
}
