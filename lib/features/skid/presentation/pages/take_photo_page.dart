import 'package:flutter/material.dart';
import 'package:skid/core/component/default_appbar.dart';

class TakePhotoPage extends StatelessWidget {
  const TakePhotoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context),
    );
  }
}
