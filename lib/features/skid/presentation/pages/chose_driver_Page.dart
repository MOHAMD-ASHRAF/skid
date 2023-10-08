import 'package:flutter/material.dart';

import 'package:skid/features/skid/presentation/widgets/chose_driver_Item.dart';

class ChoseDriverPage extends StatelessWidget {
  const ChoseDriverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: ChoseDriverItem(),
      ),
    ));
  }
}

