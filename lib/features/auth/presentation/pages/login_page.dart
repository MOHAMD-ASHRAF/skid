import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skid/core/component/default_button.dart';
import 'package:skid/core/component/default_text_form_feild.dart';
import 'package:skid/core/component/test_widget.dart';
import 'package:skid/core/constant/string.dart';
import 'package:skid/features/auth/presentation/cubit/phone_auth_cubit.dart';
import 'package:skid/features/auth/presentation/widgets/show_Progress_indicator.dart';


// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({Key? key,}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PhoneAuthCubit, PhoneAuthState>(
      listener: (context, state) {
        if(_formKey.currentState!.validate()){
          if(state is LoginLoadingState){
            showProgressIndicator(context);
        }else if(state is LoginSuccessState){
            Navigator.pushNamed(context, homePage);
          }else if(state is LoginErrorState){
            Navigator.pop(context);
            String message = (state).messageError;
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(message),
              backgroundColor: Colors.black,
              duration: const Duration(seconds: 3),
            )
            );
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Image.asset('assets/images/CircleHalfTilt.png',
                    fit: BoxFit.cover,
                    width: 100,
                    height:100,),
                      const TextWidget(text: 'Welcome to', fontSize: 18),
                      const TextWidget(
                        text: 'Skid',
                        fontSize: 38,
                        fontWeight: FontWeight.bold,),
                      const SizedBox(height: 32,),
                      const TextWidget(text: 'name', fontSize: 18),
                      const SizedBox(height: 16,),
                      DefaultTextFormFeild(
                          controller: nameController,
                          maxLength: 30,

                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'pleas enter your name';
                            }
                            return null;
                          }),
                      const SizedBox(height: 32,),
                      const TextWidget(
                          text: 'Email Address (Optional)', fontSize: 18),
                      const SizedBox(height: 16,),
                      DefaultTextFormFeild(
                        maxLength: 30,
                        controller: emailController,
                      ),
                      const SizedBox(height: 66,),
                      DefaultMaterialButton(text: 'Continue', onPressed: () {
                        BlocProvider.of<PhoneAuthCubit>(context).addUser(name: nameController.text, email: emailController.text);
                      },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
