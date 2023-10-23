import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skid/core/component/default_appbar.dart';
import 'package:skid/core/component/default_button.dart';
import 'package:skid/core/component/test_widget.dart';
import 'package:skid/core/constant/my_color.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:skid/core/constant/string.dart';

import '../../../../core/component/default_text_form_feild.dart';

class PackageDetailsPage extends StatefulWidget {
  const PackageDetailsPage({Key? key}) : super(key: key);

  @override
  State<PackageDetailsPage> createState() => _PackageDetailsPageState();
}

class _PackageDetailsPageState extends State<PackageDetailsPage> {
  final List<String> itemsHeightAndWidth = [
    'less than 1 m',
    '1 m',
    '2 m',
    '3 m',
    '4 m',
    '5 m',
    '6 m',
    'more than 6 m',
  ];

  final List<String> itemWeight = [
    'less than 1 m',
    '1 kg',
    '2 kg',
    '3 kg',
    '4 kg',
    '5 kg',
    '6 kg',
    'more than 6 kg',
  ];

  String? selectedHeightValue;
  String? selectedWidthValue;
  String? selectedWeightValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context),
      body: Padding(
        padding: const EdgeInsets.only(top: 20,right: 20,left: 20),
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           TextWidget(
            text: 'Provide more details about your parcel',
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
           SizedBox(
            height: 18.h,
          ),
           Center(
              child: TextWidget(text: 'Height of Package', fontSize: 18.sp)),
          const SizedBox(
            height: 10,
          ),
          DropdownButton2(
              isExpanded: true,
              buttonStyleData: buttonStyleData(),
              hint: hint(text: 'height in meter'),
              items: itemsHeightAndWidth
                  .map(
                    (String item) => dropdownMenuItem(item),
                  )
                  .toList(),
              value: selectedHeightValue,
              onChanged: (String? value) {
                setState(() {
                  selectedHeightValue = value;
                });
              }),
           SizedBox(
            height: 24.h,
          ),
           Center(
              child: TextWidget(text: 'Width of Package', fontSize: 18.sp)),
           SizedBox(
            height: 10.h,
          ),
          DropdownButton2(
              isExpanded: true,
              buttonStyleData: buttonStyleData(),
              hint: hint(text: 'Width in meter'),
              items: itemsHeightAndWidth
                  .map(
                    (String item) => dropdownMenuItem(item),
                  )
                  .toList(),
              value: selectedWidthValue,
              onChanged: (String? value) {
                setState(() {
                  selectedWidthValue = value;
                });
              }),
           SizedBox(
            height: 24.h,
          ),
           Center(
              child: TextWidget(text: 'Weight of Package', fontSize: 18.sp)),
           SizedBox(
            height: 8.h,
          ),
          DropdownButton2(
              isExpanded: true,
              buttonStyleData: buttonStyleData(),
              hint: hint(text: 'Weight in Kg'),
              items: itemWeight
                  .map(
                    (String item) => dropdownMenuItem(item),
                  )
                  .toList(),
              value: selectedWeightValue,
              onChanged: (String? value) {
                setState(() {
                  selectedWeightValue = value;
                });
              }),
           SizedBox(
            height: 24.h,
          ),
          const TextWidget(text: 'Quantity', fontSize: 18),
          DefaultTextFormFeild(
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 16,
          ),
          const TextWidget(
              text:
                  'Note This: the driver will have a package hand to verify the weight of your package, if here is difference  in the weight of package , it may affect the delivery cost',
              fontSize: 14),
           SizedBox(
            height: 10.h,
          ),
           DefaultMaterialButton(text: 'Next', onPressed: (){
            Navigator.pushNamed(context, contentsPackagePage);
          },)
        ],
      ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> dropdownMenuItem(String item) {
    return DropdownMenuItem<String>(
      value: item,
      child: Text(
        item,
        style: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Row hint({required String text}) => Row(
        children: [
          const Icon(Icons.list, size: 16, color: Colors.black),
          const SizedBox(
            width: 4,
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );

  ButtonStyleData buttonStyleData() {
    return ButtonStyleData(
      height: 50,
      width: double.infinity,
      padding:  const EdgeInsets.only(left: 14, right: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(width: 1, color: MyColor.green),
        color: MyColor.grey,
      ),
    );
  }
}
