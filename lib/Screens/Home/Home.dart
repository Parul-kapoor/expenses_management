import 'package:expenses_management/Constants/Constant.dart';
import 'package:expenses_management/Screens/Income/AddNewIncome.dart';
import 'package:expenses_management/Screens/Invoice/AddNewInvoice.dart';
import 'package:expenses_management/Screens/Invoice/Invoices.dart';
import 'package:expenses_management/Utils/CommonWidgets.dart';
import 'package:expenses_management/Utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import '../../Constants/Colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: buildCustomAppBar(
        title: 'EXPENSOR APP',
        trailing: const SizedBox(),
        context: context,
        centerTitle: true
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             buildCreateNewExpense(),
            const SizedBox(height: 20,),
            buildCreateNewInvoice(),
            const SizedBox(height: 20,),
            buildCreateNewGallery(),
            const SizedBox(height: 20,),
            buildCreateNewIncome()
          ],
        ),
      ),
    );
  }

  buildCreateNewExpense(){
    return MaterialButton(
      onPressed: () {
        Navigator.pushNamed(context, routeAddExpense);
      },
      color: green219653,
      minWidth: SizeConfig.screenWidth,
      height: SizeConfig.blockSizeVertical! * 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: const Text(
        'CREATE NEW EXPENSE',
        style: TextStyle(
            color: whiteF7f7f7, fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }

  buildCreateNewInvoice(){
    return MaterialButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const Invoices()));
      },
      color: green219653,
      minWidth: SizeConfig.screenWidth,
      height: SizeConfig.blockSizeVertical! * 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: const Text(
        'CREATE NEW INVOICE',
        style: TextStyle(
            color: whiteF7f7f7, fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }

  buildCreateNewGallery(){
    return MaterialButton(
      onPressed: () {
        Navigator.pushNamed(context, routeAddGallery);
      },
      color: green219653,
      minWidth: SizeConfig.screenWidth,
      height: SizeConfig.blockSizeVertical! * 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: const Text(
        'CREATE NEW GALLERY',
        style: TextStyle(
            color: whiteF7f7f7, fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }

  buildCreateNewIncome(){
    return MaterialButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const AddNewIncome() ));
      },
      color: green219653,
      minWidth: SizeConfig.screenWidth,
      height: SizeConfig.blockSizeVertical! * 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: const Text(
        'CREATE NEW INCOME',
        style: TextStyle(
            color: whiteF7f7f7, fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }
}
