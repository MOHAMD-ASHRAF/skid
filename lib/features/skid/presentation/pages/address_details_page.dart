import 'package:flutter/material.dart';
import 'package:skid/core/component/default_appbar.dart';

class AddressDetailsPage extends StatelessWidget {
  const AddressDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(child: Column()),
      ),
    );
  }
}
