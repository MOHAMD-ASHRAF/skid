

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skid/core/component/default_button.dart';
import 'package:skid/core/constant/my_color.dart';
import 'package:skid/core/constant/string.dart';
import 'package:skid/features/auth/presentation/cubit/phone_auth_cubit.dart';
import 'package:skid/features/auth/presentation/widgets/background_widget.dart';
import 'package:skid/features/auth/presentation/widgets/build_intro_text.dart';
import 'package:skid/features/auth/presentation/widgets/flag_widget.dart';
import 'package:skid/features/auth/presentation/widgets/show_Progress_indicator.dart';


class EnterPhonePage extends StatelessWidget {
  EnterPhonePage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String phoneNumber ;

  Future<void> _register(BuildContext context)async {
    if(!_formKey.currentState!.validate()){
      Navigator.pop(context);
    }else{
      Navigator.pop(context);
          _formKey.currentState!.save();
      BlocProvider.of<PhoneAuthCubit>(context).submitPhoneNumber(phoneNumber);
    }
  }

  Widget _buildPhoneNumberSubmitBloc() {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listenWhen: (previous, current) {
        return previous != current;
      },
      listener: (context, state) {
         if (state is LoadingState) {
          showProgressIndicator(context);
        }  if (state is PhoneNumberSubmitedState) {
          Navigator.pop(context);
          Navigator.pushNamed(context, otpPage, arguments: phoneNumber);
        }  if (state is PhoneAuthErrorState) {
          Navigator.pop(context);
          String message = (state).messageError;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(message),
            backgroundColor: Colors.black,
            duration: const Duration(seconds: 3),
          ));
        }
      },
      child: Container(),
    );
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
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(32),
                    topLeft: Radius.circular(32)),
              ),
              height: 230.h,
              width: double.infinity,
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
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 4,
                              child: TextFormField(
                                onTapOutside: (event){
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                cursorColor: MyColor.green,
                                keyboardType: TextInputType.phone,
                                maxLength: 11,
                                validator: (value) {
                                  if (value!.length < 11) {
                                    return "enter phone number";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  phoneNumber = value!;
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
                         SizedBox(
                          height: MediaQuery.of(context).size.height / 40,
                        ),
                        Center(
                            child: DefaultMaterialButton(
                                text: 'send', onPressed: () {
                                 showProgressIndicator(context);
                                  _register(context);
                            })
                        ),
                        _buildPhoneNumberSubmitBloc(),
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
