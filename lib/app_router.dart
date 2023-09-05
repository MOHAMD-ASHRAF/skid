import 'package:flutter/material.dart';
import 'package:skid/core/constant/string.dart';
import 'package:skid/features/auth/presentation/pages/OTP_page.dart';
import 'package:skid/features/auth/presentation/pages/enter_phone_page.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case enterPhonePage:
        return MaterialPageRoute(builder: (_) => EnterPhonePage());
    }
    switch (settings.name) {
      case otpPage:
        return MaterialPageRoute(builder: (_) => const OtpPage());
    }
    return null;
  }
}
