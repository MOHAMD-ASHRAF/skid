import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skid/core/constant/string.dart';
import 'package:skid/features/auth/presentation/cubit/phone_auth_cubit.dart';
import 'package:skid/features/auth/presentation/pages/OTP_page.dart';
import 'package:skid/features/auth/presentation/pages/enter_phone_page.dart';
import 'package:skid/features/auth/presentation/pages/home_page.dart';

class AppRouter {
  PhoneAuthCubit? phoneAuthCubit;

  AppRouter() {
    phoneAuthCubit = PhoneAuthCubit();
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case enterPhonePage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<PhoneAuthCubit>.value(
                  value: phoneAuthCubit!,
                  child: EnterPhonePage(),
                ));
      case otpPage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<PhoneAuthCubit>.value(
                  value: phoneAuthCubit!,
                  child: const OtpPage(),
                ));
      case homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
    return null;
  }
}
