
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skid/core/component/default_appbar.dart';
import 'package:skid/core/component/default_button.dart';

import 'package:skid/core/constant/my_color.dart';
import 'package:skid/features/skid/cubit/skid_cubit.dart';

class TakePhotoPage extends StatelessWidget {
  const TakePhotoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: defaultAppBar(context),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  height: 400,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image:  DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(BlocProvider.of<SkidCubit>(context).profileImage!),
                    ),
                      border: Border.all(color: MyColor.green, width: 1.2),
                      borderRadius: BorderRadius.circular(20)),
              ),

              const SizedBox(
                height: 200,
              ),
              DefaultMaterialButton(
                text: 'Next',
                onPressed: () {

                },
              )
            ],
          ),
        ));
  }
}
