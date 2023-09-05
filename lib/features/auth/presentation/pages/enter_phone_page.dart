import 'package:flutter/material.dart';
import 'package:skid/core/constant/my_color.dart';
import 'package:skid/core/constant/string.dart';
import 'package:skid/features/auth/presentation/widgets/background_widget.dart';

class EnterPhonePage extends StatelessWidget {
  EnterPhonePage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();

  void checkValidate(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, otpPage);
    }
  }

  String generateCountryFlag() {
    String countryCode = 'eg';
    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
    return flag;
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Enter phone number",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "mobile number",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      SizedBox(height: 8,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                border: Border.all(color: MyColor.green),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(child: Text(generateCountryFlag() + ' +20', style: TextStyle(fontSize: 16),)),
                            )
                          ),
                          SizedBox(width: 5,),
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
                      MaterialButton(
                        onPressed: () {
                          checkValidate(context);
                        },
                        child: const Text('send'),
                      )
                    ],
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
//generateCountryFlag() + ' +20', style: TextStyle(fontSize: 16),