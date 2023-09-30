import 'package:flutter/material.dart';
import 'package:skid/core/component/default_appbar.dart';

class SetDatePage extends StatelessWidget {
  const SetDatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context),
    );
  }
}
