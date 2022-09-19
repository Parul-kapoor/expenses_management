import 'package:expenses_management/Constants/Colors.dart';
import 'package:expenses_management/Utils/CommonWidgets.dart';
import 'package:expenses_management/Utils/SizeConfig.dart';
import 'package:flutter/material.dart';

class InvoiceDetails extends StatefulWidget {
  const InvoiceDetails({Key? key}) : super(key: key);

  @override
  State<InvoiceDetails> createState() => _InvoiceDetailsState();
}

class _InvoiceDetailsState extends State<InvoiceDetails> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: buildCustomAppBar(
          trailing: const SizedBox(),
          context: context,
          centerTitle: true,
          title: 'Invoice Details'),
      body: const SafeArea(
          child: Center(
        child: Text('Invoice table will be presented here'),
      )),
    );
  }
}
