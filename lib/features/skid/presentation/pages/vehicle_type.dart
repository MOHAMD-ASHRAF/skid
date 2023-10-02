import 'package:flutter/material.dart';
import 'package:skid/core/component/default_appbar.dart';
import 'package:skid/core/component/test_widget.dart';

class VehicleTypePage extends StatelessWidget {
  const VehicleTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context),
      body:  Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              text: 'select a Vehile Type',
              fontSize: 32,
            ),
            SizedBox(height: 32,),
            Container(
              decoration:  BoxDecoration(
                border: Border.all(width: 1 , color: Colors.green),
                borderRadius: BorderRadius.circular(10),
              ),

            )

          ],
        ),
      ),
    );
  }
}
