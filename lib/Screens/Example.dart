import 'package:flutter/material.dart';

import '../Constants/Colors.dart';

class ExampleData3_1 extends StatefulWidget {
  const ExampleData3_1({Key? key}) : super(key: key);

  @override
  State<ExampleData3_1> createState() => _ExampleData3_1State();
}

class _ExampleData3_1State extends State<ExampleData3_1> {

  bool checkbox1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CheckboxListTile(value: checkbox1, onChanged: (value){
                setState(() {
                  checkbox1 = value!;
                });
              },
                title: Text('Text 1'),
                dense: true,
                controlAffinity: ListTileControlAffinity.trailing,
                shape: CircleBorder(),
              )
            ],
          )),
    );
  }
}
