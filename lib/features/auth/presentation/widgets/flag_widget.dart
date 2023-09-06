import 'package:flutter/material.dart';
import 'package:skid/core/constant/my_color.dart';

class FlagWidget extends StatelessWidget {
  const FlagWidget({Key? key}) : super(key: key);

  String generateCountryFlag() {
    String countryCode = 'eg';
    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
            (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
    return flag;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: MyColor.green),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(child: Text('${generateCountryFlag()} +20', style: const TextStyle(fontSize: 16),)),
    );
  }
}
