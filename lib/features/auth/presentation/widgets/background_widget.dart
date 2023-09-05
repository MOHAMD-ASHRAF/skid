import 'package:flutter/material.dart';

class BackGroundWidget extends StatelessWidget {
  const BackGroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Image.network(
        'https://www.itl.cat/pngfile/big/302-3028814_bicycle-on-the-city-street-iphone-wallpaper-hd.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
