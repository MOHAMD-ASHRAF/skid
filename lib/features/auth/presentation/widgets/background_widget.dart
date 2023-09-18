import 'package:flutter/material.dart';


class BackGroundWidget extends StatelessWidget {
  const BackGroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset('assets/images/backgoround.jpg',
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      )
    );
  }
}


