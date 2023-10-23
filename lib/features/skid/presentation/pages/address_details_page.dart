import 'package:flutter/material.dart';
import 'package:skid/core/component/default_appbar.dart';
import 'package:skid/core/component/default_button.dart';
import 'package:skid/core/constant/string.dart';
import 'package:skid/features/skid/presentation/widgets/body_Item_of_address_page.dart';


class AddressDetailsPage extends StatelessWidget {
  const AddressDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context),
      body:   SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const BodyItemOfAddressPage(),
                const SizedBox(height: 40,),
                DefaultMaterialButton(text: 'Next', onPressed: (){
                  Navigator.pushNamed(context, setDatePage);
                },)
              ],
            ),
          )
      ),
    );
  }
}


