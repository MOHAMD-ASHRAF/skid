import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skid/core/component/default_appbar.dart';
import 'package:skid/core/component/default_button.dart';
import 'package:skid/core/component/default_text_form_feild.dart';
import 'package:skid/core/component/test_widget.dart';
import 'package:skid/core/constant/string.dart';

class ContentsPackagePage extends StatelessWidget {
  const ContentsPackagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context),
      body:  Padding(
        padding:  const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               TextWidget(text: 'what is in the package ?', fontSize: 20.sp,fontWeight: FontWeight.bold,),
               const SizedBox(
                height: 20,
              ),
              const Center(
                  child: TextWidget(text: 'what is in the package', fontSize: 18)),
              const SizedBox(
                height: 10,
              ),
              DefaultTextFormFeild(),
              const SizedBox(
                height: 20,
              ),
              const Center(
                  child: TextWidget(text: 'Additional Note (optional)', fontSize: 18)),
              const SizedBox(
                height: 10,
              ),
              DefaultTextFormFeild(maxLine: 12,),
               SizedBox(
                height: 40.h,
              ),
              DefaultMaterialButton(text: 'Next', onPressed: (){
                Navigator.pushNamed(context, examplePhotoPage);
              },)
            ],
          ),
        ),
      ),
    );
  }
}
