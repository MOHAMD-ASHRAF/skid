import 'package:flutter/material.dart';

import 'package:skid/core/component/default_appbar.dart';
import 'package:skid/core/component/default_button.dart';
import 'package:skid/core/component/default_text_form_feild.dart';
import 'package:skid/core/component/test_widget.dart';
import 'package:skid/core/constant/string.dart';


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
                const BodyItem(),
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

class BodyItem extends StatelessWidget {
  const BodyItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
    children: [
       Row(
        children: [
         Image.asset('assets/images/send.png',width: 50,height: 50,),
          const SizedBox(width: 6,),
          const Expanded(child: TextWidget(text: "Where is the Package being  delivered to ?", fontSize: 20,fontWeight: FontWeight.bold,)),
        ],
      ),
      const SizedBox(height: 32,),
      const TextWidget(text: "Enter PostCode", fontSize: 16),
      const SizedBox(height: 16,),
      DefaultTextFormFeild(
        keyboardType: TextInputType.number,
      ),
      const SizedBox(height: 32,),
      const TextWidget(text: "Street Address", fontSize: 16),
      const SizedBox(height: 16,),
      DefaultTextFormFeild(
        keyboardType: TextInputType.number,
      ),
      const SizedBox(height: 32,),
      const TextWidget(text: "Street Address (Optional)", fontSize: 16),
      const SizedBox(height: 16,),
      DefaultTextFormFeild(
        keyboardType: TextInputType.number,
      ),
      const SizedBox(height: 32,),
      const TextWidget(text: "City/Town", fontSize: 16),
      const SizedBox(height: 16,),
      DefaultTextFormFeild(
        keyboardType: TextInputType.number,
      ),
      const SizedBox(height: 32,),
      const TextWidget(text: "Name of Receiver ", fontSize: 16),
      const SizedBox(height: 16,),
      DefaultTextFormFeild(
        keyboardType: TextInputType.number,
      ),
      const SizedBox(height: 32,),
      const TextWidget(text: "Receiver Phone Number", fontSize: 16),
      const SizedBox(height: 16,),
      DefaultTextFormFeild(
        keyboardType: TextInputType.number,
      ),
      /////////////////////////////////////////////////////
      const SizedBox(height: 32,),
      Row(
        children: [
          Image.asset('assets/images/location.png',width: 50,height: 50,),
          const SizedBox(width: 6,),
          const Expanded(child: TextWidget(text: "Provide the pickup location ", fontSize: 20,fontWeight: FontWeight.bold,)),
        ],
      ),
      const SizedBox(height: 32,),
      const TextWidget(text: "Enter PostCode", fontSize: 16),
      const SizedBox(height: 16,),
      DefaultTextFormFeild(
        keyboardType: TextInputType.number,
      ),
      const SizedBox(height: 32,),
      const TextWidget(text: "Street Address", fontSize: 16),
      const SizedBox(height: 16,),
      DefaultTextFormFeild(
        keyboardType: TextInputType.number,
      ),
      const SizedBox(height: 32,),
      const TextWidget(text: "Street Address (Optional)", fontSize: 16),
      const SizedBox(height: 16,),
      DefaultTextFormFeild(
        keyboardType: TextInputType.number,
      ),
      const SizedBox(height: 32,),
      const TextWidget(text: "City/Town", fontSize: 16),
      const SizedBox(height: 16,),
      DefaultTextFormFeild(
        keyboardType: TextInputType.number,
      ),
    ],
      );
  }
}
