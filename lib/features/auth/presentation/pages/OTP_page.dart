import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skid/core/component/defult_buton.dart';
import 'package:skid/core/constant/string.dart';
import 'package:skid/features/auth/presentation/cubit/phone_auth_cubit.dart';
import 'package:skid/features/auth/presentation/widgets/OTO_text_Feild_widget.dart';

class OtpPage extends StatelessWidget {
  OtpPage({
    Key? key,
    this.phoneNumber,
  }) : super(key: key);
  final phoneNumber;
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  TextEditingController c3 = TextEditingController();
  TextEditingController c4 = TextEditingController();
  TextEditingController c5 = TextEditingController();
  TextEditingController c6 = TextEditingController();

  Widget _buildPhoneVerificationBloc() {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listenWhen: (previous, current) {
        return previous != current;
      },
      listener: (context, state) {
        if (state is LoadingState) {
          showProgressIndicator(context);
        } else if (state is PhoneOTPVerifiedState) {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(
            context,
            homePage,
          );
        } else if (state is PhoneAuthErrorState) {
          String message = state.messageError;
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

  void _login(BuildContext context) {
    BlocProvider.of<PhoneAuthCubit>(context).submitOTP(
        c1.toString() +
        c2.toString() +
        c3.toString() +
        c4.toString() +
        c5.toString() +
        c6.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.network(
              'https://www.itl.cat/pngfile/big/302-3028814_bicycle-on-the-city-street-iphone-wallpaper-hd.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 350,
              width: double.infinity,
              color: Colors.white,
              child: Form(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Confirm OTP",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        "A OTP SENT TO 01022536565 ",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      const Text(
                        "kind enter below  the 6 digitl code ",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
                          OTPTextFeildWidget(
                            controller: c1,
                          ),
                          OTPTextFeildWidget(
                            controller: c2,
                          ),
                          OTPTextFeildWidget(
                            controller: c3,
                          ),
                          OTPTextFeildWidget(
                            controller: c4,
                          ),
                          OTPTextFeildWidget(
                            controller: c5,
                          ),
                          OTPTextFeildWidget(
                            controller: c6,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          defaultMaterialButton(
              text: 'verify',
              onPressed: () {
                showProgressIndicator(context);
                _login(context);
              }),
          _buildPhoneVerificationBloc(),
        ],
      ),
    );
  }

  void showProgressIndicator(BuildContext context) {
    AlertDialog alertDialog = const AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        ),
      ),
    );
    showDialog(
        context: context,
        barrierColor: Colors.white.withOpacity(0),
        barrierDismissible: false,
        builder: (context) {
          return alertDialog;
        });
  }
}
