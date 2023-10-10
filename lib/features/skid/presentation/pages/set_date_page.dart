import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skid/core/component/default_appbar.dart';
import 'package:skid/core/component/default_button.dart';
import 'package:skid/core/component/test_widget.dart';
import 'package:skid/core/constant/string.dart';

class SetDatePage extends StatefulWidget {
  const SetDatePage({super.key});

  @override
  State<SetDatePage> createState() => _SetDatePageState();
}

class _SetDatePageState extends State<SetDatePage> {
  late DateTime dateTime;

  @override
  void initState() {
    dateTime = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const TextWidget(text: 'Set the date and time to send the package', fontSize: 26,fontWeight: FontWeight.bold,),
            SizedBox(height: 200,),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  showDateAndTime(),
                  SizedBox(height: 32,),
                  DefaultMaterialButton(
                    onPressed: () {
                       Navigator.pushNamed(context, vehicleTypePage);
                    },
                    text: 'next',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column showDateAndTime() {
    return Column(
            children: [
              TextWidget(fontSize: 25, text: 'Date: ${dateTime.day.toString()}-${dateTime.month.toString()}-${dateTime.year.toString()}'),
              TextWidget(fontSize: 25, text: 'Time: ${dateTime.hour.toString()}:${dateTime.minute.toString()}'),
              TextButton(onPressed: (){_showDataPicker(context);}, child: const TextWidget(fontSize: 18, text: 'change date',))
            ],
          );
  }




  Future<dynamic> _showDataPicker(BuildContext context) {
    return showCupertinoModalPopup(
        context: context,
        builder: (context) => Container(
              height: MediaQuery.of(context).size.height * 0.4,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('done')),
                  Expanded(
                    child: CupertinoDatePicker(
                      backgroundColor: Colors.white,
                      initialDateTime: dateTime,
                      onDateTimeChanged: (DateTime newTime) {
                        setState(() {
                          dateTime = newTime;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ));
  }
}
