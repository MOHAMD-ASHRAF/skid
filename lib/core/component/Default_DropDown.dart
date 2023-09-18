import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:skid/core/constant/my_color.dart';

class DefaultDropDown extends StatefulWidget {
  const DefaultDropDown({Key? key}) : super(key: key);

  @override
  State<DefaultDropDown> createState() => _DefaultDropDownState();
}

class _DefaultDropDownState extends State<DefaultDropDown> {


  late final List<String> items;
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton2(
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
    );
  }
}
