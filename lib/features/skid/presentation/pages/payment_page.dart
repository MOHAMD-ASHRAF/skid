import 'package:flutter/material.dart';
import 'package:skid/core/component/default_appbar.dart';

class PayPalPage extends StatelessWidget {
  const PayPalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context),
    );
  }
}
