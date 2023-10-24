import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skid/core/component/default_appbar.dart';
import 'package:skid/core/component/default_button.dart';
import 'package:skid/core/component/test_widget.dart';
import 'package:skid/core/constant/my_color.dart';
import 'package:skid/core/constant/string.dart';
import 'package:skid/features/skid/cubit/skid_cubit.dart';

class ExamplePhotoPage extends StatelessWidget {
  const ExamplePhotoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SkidCubit, SkidState>(
     listener: (context, state) {
       if(state is ProfileImagePikerLoadingState){
         showProgressIndicator(context);
       } else if (state is ProfileImagePikerSuccessState){
         Navigator.pushNamed(context, takePhotoPage);
       }else if (state is ProfileImagePikerErrorState){
         String message = state.messageError;
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
           content: Text(message),
           backgroundColor: Colors.black,
           duration: const Duration(seconds: 3),
         ));
       }
     },
      builder: (context, state) {
    return Scaffold(
      appBar: defaultAppBar(context),
      body: Padding(
        padding:  const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               TextWidget(text: 'Take a picture of the item', fontSize: 22.sp,fontWeight: FontWeight.bold,),
               SizedBox(
                height: 12.h,
              ),
              const TextWidget(text: 'Please note: Take picture of your parcel close to a recognisable object such as a chair ,pen , etc', fontSize: 14),
               SizedBox(
                height: 24.h,
              ),
              _exampleImage(context: context, imageUrl: 'assets/images/object.gif', text: 'Example 1'),
              SizedBox(
                height: 24.h,
              ),
              _exampleImage(context: context, imageUrl: 'assets/images/laptop.jpg', text: 'Example 2'),
              const SizedBox(
                height: 20,
              ),
              const TextWidget(text: 'If you do not follow this instruction, your order request will not be valid ', fontSize: 14,color: MyColor.green,fontWeight: FontWeight.bold,),
              SizedBox(
                height: 12.h,
              ),
              DefaultMaterialButton(
                text: 'Talk A Photo',
                onPressed: () {
                  openDialog(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  },
);
  }

  Widget _exampleImage({required BuildContext context , required String imageUrl ,  required String text}) {
    return Stack(
      children: [
        Container(
            width: double.infinity,
            height: 208,
            decoration: BoxDecoration(
                border: Border.all(color: MyColor.green ,width: 1.2),
                borderRadius: BorderRadius.circular(20)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(imageUrl,
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            )
        ),
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
                borderRadius: BorderRadius.circular(8)
            ),
            child: TextWidget(text: text, fontSize: 16,fontWeight: FontWeight.bold,)),
      ],
    );
  }

  Widget showProgressIndicator(BuildContext context) => const Center(
    child: CircularProgressIndicator(
          color: Colors.green,
          backgroundColor: Colors.grey,
        ),
  );}

Future openDialog(context) =>showDialog(
    context: context,
    builder: (context) =>AlertDialog(
      title: const Text('chose option'),
      content: SizedBox(
        height: 80,
        child: Column(
          children: [
            InkWell(
              onTap: (){
                BlocProvider.of<SkidCubit>(context).getProfileImageFromGallery(context);
                Navigator.pop(context);
              },
              child: const Row(
                children: [
                  Icon(Icons.image ,color: Colors.green,),
                  SizedBox(width: 10,),
                  Text('Gallery'),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            InkWell(
              onTap: (){
                BlocProvider.of<SkidCubit>(context).getProfileImageFromCamera(context);
                Navigator.pop(context);
              },
              child: const Row(
                children: [
                  Icon(Icons.camera_alt ,color: Colors.pink,),
                  SizedBox(width: 10,),
                  Text('Camera'),
                ],
              ),
            ),
          ],
        ),
      ),
    )
);


