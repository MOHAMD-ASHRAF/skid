import 'package:flutter/material.dart';
import 'package:skid/core/component/default_appbar.dart';
import 'package:skid/core/constant/my_color.dart';
import 'package:skid/features/skid/presentation/widgets/body_of_track_progress_page.dart';
import 'package:skid/features/skid/presentation/widgets/person_delivery_item_model.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/component/test_widget.dart';

class TrackProgressPage extends StatelessWidget {
  const TrackProgressPage({super.key, required this.item});
   final PersonDeliveryItemModel item;
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildContainer(),
              const BodyOfTrackProgressPage(),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildContainer() {
    return Container(
      height: 110,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32), topRight: Radius.circular(32)),
          color: Colors.black),
      child:  Center(
        child: ListTile(
          leading:  CircleAvatar(
            radius: 30,
            backgroundColor: MyColor.green,
            child: CircleAvatar(
              radius: 26,
              backgroundImage: AssetImage(item.image),
            ),
          ),
          title: TextWidget(
            text: item.name,
            fontSize: 16,
            color: Colors.white,
          ),
          subtitle:  Row(
            children: [
              TextWidget(
                text: item.rate,
                fontSize: 12,
                color: Colors.white,
              ),
              const Icon(
                Icons.star,
                color: Colors.yellow,
                size: 18,
              )
            ],
          ),

          trailing:  Column(
            children: [
              TextWidget(
                text: "${item.time} Mins away",
                fontSize: 12,
                color: Colors.white,
              ),
              const SizedBox(height: 8,),
              GestureDetector(
                onTap: () {
                  _makePhoneCall('01022953656');
                },
                child: Image.asset(
                  'assets/images/phone_green.png',
                  width: 30,
                  height: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


