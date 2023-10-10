import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:skid/core/component/default_button.dart';
import 'package:skid/core/constant/string.dart';
import 'package:skid/features/auth/presentation/cubit/phone_auth_cubit.dart';
import 'package:skid/features/auth/presentation/widgets/background_widget.dart';


class OtpPage extends StatelessWidget {
  final phoneNumber;
  OtpPage({
    Key? key,
    this.phoneNumber,
  }) : super(key: key);

  late String otpCode;
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );


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
            loginPage,
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
    BlocProvider.of<PhoneAuthCubit>(context).submitOTP(otpCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackGroundWidget(),
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
                       Row(
                         children: [
                          const Text(
                            "A OTP SENT TO ",
                            style:  TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                           Text(
                             " $phoneNumber ",
                             style: const TextStyle(fontSize: 15, color:Colors.green),
                           ),
                         ],
                       ),
                      const Text(
                        "kind enter below  the 6 digital code ",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      Pinput(
                        length: 6,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            border: Border.all(color: Colors.green)
                          )
                        ),
                        onCompleted: (pin) {
                          otpCode = pin;
                          print("Completed $otpCode");
                        },
                      ),


                      const SizedBox(
                        height: 20,
                      ),
                      DefaultMaterialButton(
                          text: 'verify',
                          onPressed: () {
                            showProgressIndicator(context);
                            _login(context);
                          }),
                      _buildPhoneVerificationBloc(),
                    ],
                  ),
                ),
              ),
            ),
          ),
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
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
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
