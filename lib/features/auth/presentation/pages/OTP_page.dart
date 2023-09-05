import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skid/features/auth/presentation/widgets/OTO_text_Feild_widget.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          SizedBox(width: double.infinity,height: double.infinity,
            child: Image.network('https://www.itl.cat/pngfile/big/302-3028814_bicycle-on-the-city-street-iphone-wallpaper-hd.jpg',fit: BoxFit.cover,),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 350,
              width: double.infinity,
              color: Colors.white,
              child:   const Form(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      Text("Confirm OTP",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      SizedBox(height: 40,),
                      Text("A OTP SENT TO 01022536565 ",style: TextStyle(fontSize: 15, color: Colors.grey),),
                      Text("kind enter below  the 6 digitl code ",style: TextStyle(fontSize: 15, color: Colors.grey),),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OTPTextFeildWidget(),
                          OTPTextFeildWidget(),
                          OTPTextFeildWidget(),
                          OTPTextFeildWidget(),
                          OTPTextFeildWidget(),
                          OTPTextFeildWidget(),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
