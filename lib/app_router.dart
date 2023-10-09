import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skid/core/constant/string.dart';
import 'package:skid/features/auth/presentation/cubit/phone_auth_cubit.dart';
import 'package:skid/features/auth/presentation/pages/OTP_page.dart';
import 'package:skid/features/auth/presentation/pages/enter_phone_page.dart';
import 'package:skid/features/auth/presentation/pages/login_page.dart';
import 'package:skid/features/skid/presentation/pages/address_details_page.dart';
import 'package:skid/features/skid/presentation/pages/contents_packeg_page.dart';
import 'package:skid/features/skid/presentation/pages/chose_driver_Page.dart';
import 'package:skid/features/skid/presentation/pages/package_details_page.dart';
import 'package:skid/features/skid/presentation/pages/example_photo_page.dart';
import 'package:skid/features/skid/presentation/pages/home_page.dart';
import 'package:skid/features/skid/presentation/pages/payment_page.dart';
import 'package:skid/features/skid/presentation/pages/set_date_page.dart';
import 'package:skid/features/skid/presentation/pages/take_photo_page.dart';
import 'package:skid/features/skid/presentation/pages/track_progress_page.dart';
import 'package:skid/features/skid/presentation/pages/vehicle_type.dart';
import 'package:skid/features/skid/presentation/widgets/person_delivery_item_model.dart';

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
        final phoneNumber = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => BlocProvider<PhoneAuthCubit>.value(
                  value: phoneAuthCubit!,
                  child: OtpPage(phoneNumber: phoneNumber),
                ));
      case loginPage:
        return MaterialPageRoute(builder: (_) =>  LoginPage());
      case homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case packageDetailsPage:
        return MaterialPageRoute(builder: (_) => const PackageDetailsPage());
      case contentsPackagePage:
        return MaterialPageRoute(builder: (_) => const ContentsPackagePage());
      case examplePhotoPage:
        return MaterialPageRoute(builder: (_) => const ExamplePhotoPage());
      case takePhotoPage:
        return MaterialPageRoute(builder: (_) => const TakePhotoPage());
      case addressDetailsPage:
        return MaterialPageRoute(builder: (_) => const AddressDetailsPage());
      case setDatePage:
        return MaterialPageRoute(builder: (_) => const SetDatePage());
      case vehicleTypePage:
        return MaterialPageRoute(builder: (_) => const VehicleTypePage());
      case payPalPage:
        return MaterialPageRoute(builder: (_) => const PayPalPage());
        case choseDriverPage:
      return MaterialPageRoute(builder: (_) => const ChoseDriverPage());
      case trackProgressPage:
        final PersonDeliveryItemModel personDeliveryItemModel = settings.arguments as PersonDeliveryItemModel;
        return MaterialPageRoute(builder: (context) =>   TrackProgressPage(item: personDeliveryItemModel));

    }
    return null;
  }
}
