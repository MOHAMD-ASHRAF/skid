import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skid/core/component/default_button.dart';
import 'package:skid/core/constant/string.dart';
import 'package:skid/features/auth/presentation/cubit/phone_auth_cubit.dart';


class HomePage extends StatefulWidget {
   const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
PhoneAuthCubit phoneAuthCubit = PhoneAuthCubit();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<PhoneAuthCubit>(
        create: (context) => phoneAuthCubit,
        child: Center(
          child: defaultMaterialButton(text: 'log Out', onPressed: () async {
            await phoneAuthCubit.logOut();
            Navigator.pushReplacementNamed(context, enterPhonePage);
            },),
        ),
      ),
    );
  }
}
