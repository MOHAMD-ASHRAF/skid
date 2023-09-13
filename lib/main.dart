import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:skid/app_router.dart';
import 'package:skid/core/constant/string.dart';
import 'package:skid/features/auth/presentation/pages/enter_phone_page.dart';



late String initialRoute;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseAuth.instance.authStateChanges().listen((user) {
    if (user == null) {
      initialRoute = enterPhonePage;
    } else {
      initialRoute = homePage;
    }
  });


  runApp(MyApp(
    appRouter: AppRouter(),
  ));



}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: initialRoute,
    //  home: EnterPhonePage(),
    );
  }
}
