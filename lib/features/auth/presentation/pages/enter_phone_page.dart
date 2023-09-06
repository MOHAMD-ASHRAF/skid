import 'package:flutter/material.dart';
import 'package:skid/core/component/defult_buton.dart';
import 'package:skid/core/constant/my_color.dart';
import 'package:skid/core/constant/string.dart';
import 'package:skid/features/auth/presentation/widgets/background_widget.dart';
import 'package:skid/features/auth/presentation/widgets/build_intro_text.dart';
import 'package:skid/features/auth/presentation/widgets/flag_widget.dart';

class EnterPhonePage extends StatelessWidget {
  EnterPhonePage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();

  void checkValidate(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, otpPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackGroundWidget(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 280,
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildIntroText(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                              flex: 1,
                              child: FlagWidget(),
                            ),
                            const SizedBox(width: 5,),
                            Expanded(
                              flex: 4,
                              child: TextFormField(
                                controller: phoneController,
                                cursorColor: MyColor.green,
                                keyboardType: TextInputType.phone,
                                maxLength: 11,
                                validator: (value) {
                                  if (value!.length < 11) {
                                    return "enter phone number";
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  hintText: ' 000 000 000',
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: MyColor.green)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: MyColor.green)),
                                  filled: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child:defaultMaterialButton(text: 'send', onPressed: (){})
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}