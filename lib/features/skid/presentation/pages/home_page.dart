import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skid/core/component/default_button.dart';
import 'package:skid/core/component/test_widget.dart';
import 'package:skid/core/constant/string.dart';
import 'package:skid/features/auth/presentation/cubit/phone_auth_cubit.dart';
import 'package:skid/features/skid/presentation/widgets/home_item.dart';

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextWidget(
                text: 'Hi',
                fontSize: 22,
              ),
              const TextWidget(
                text: 'Mohamed',
                fontSize: 38,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 20,
              ),
              const TextWidget(
                text: 'What are you sending today?',
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 30,
              ),
              GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.90,
                  crossAxisSpacing: 20,
                ),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children:  [
                  HomeItem(
                    onTap: (){
                      print('object');
                    },
                    image: 'assets/images/pizza0.gif',
                    title: 'food Delivery',
                    subTitle: 'less than 10kg',
                  ),
                  HomeItem(
                    image: 'assets/images/box.gif',
                    title: 'Parcel',
                    subTitle: 'less than 10kg',
                  ),
                  HomeItem(
                    image: 'assets/images/shopping-card.gif',
                    title: 'Groceries',
                    subTitle: 'less than 10kg',
                  ),
                  HomeItem(
                    image: 'assets/images/tool.gif',
                    title: 'Tool',
                    subTitle: 'less than 10kg',
                  ),
                ],
              ),
              SizedBox(height: 100,),
              BlocProvider<PhoneAuthCubit>(
                create: (context) => phoneAuthCubit,
                child: Center(
                  child: defaultMaterialButton(
                    width: 150,
                    text: 'log Out',
                    onPressed: () async {
                      await phoneAuthCubit.logOut();
                      Navigator.pushReplacementNamed(context, enterPhonePage);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}