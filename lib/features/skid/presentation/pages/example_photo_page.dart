import 'package:flutter/material.dart';
import 'package:skid/core/component/default_appbar.dart';
import 'package:skid/core/component/default_button.dart';
import 'package:skid/core/component/test_widget.dart';
import 'package:skid/core/constant/my_color.dart';

class ExamplePhotoPage extends StatelessWidget {
  const ExamplePhotoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context),

      body: Padding(
        padding:  const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextWidget(text: 'what is in the package ?', fontSize: 26,fontWeight: FontWeight.bold,),
            const SizedBox(
              height: 20,
            ),
            const TextWidget(text: 'Please note: Take picture of your parcel close to a recognisable object such as a chair ,pen , etc', fontSize: 14),
            const SizedBox(
              height: 30,
            ),
            _exampleImage(context: context, imageUrl: 'assets/images/object.gif', text: 'Example 1'),
            const SizedBox(
              height: 30,
            ),
            _exampleImage(context: context, imageUrl: 'assets/images/laptop.jpg', text: 'Example 2'),
            const SizedBox(
              height: 20,
            ),
            const TextWidget(text: 'If you do not follow this instruction, your order request will not be valid ', fontSize: 14,color: MyColor.green,),
            const SizedBox(
              height: 24,
            ),
            DefaultMaterialButton(text: 'Tack a Picture', onPressed: (){
             // Navigator.pushNamed(context, examplePhotoPage);
            },)
          ],
        ),
      ),
    );
  }





  Widget _exampleImage({required BuildContext context , required String imageUrl ,  required String text}) {
    return Stack(
      children: [
        Container(
            width: double.infinity,
            height: 208,
            decoration: BoxDecoration(
                border: Border.all(color: MyColor.green ,width: 1.2),
                borderRadius: BorderRadius.circular(20)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(imageUrl,
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            )
        ),
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
                borderRadius: BorderRadius.circular(8)
            ),
            child: TextWidget(text: text, fontSize: 16,fontWeight: FontWeight.bold,)),
      ],
    );
  }
}
