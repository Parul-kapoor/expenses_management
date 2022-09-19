import 'package:expenses_management/Constants/Colors.dart';
import 'package:expenses_management/Constants/Constant.dart';
import 'package:expenses_management/Utils/CommonWidgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utils/SizeConfig.dart';

class AddNewExpenseScreen extends StatefulWidget {
  const AddNewExpenseScreen({Key? key}) : super(key: key);

  @override
  State<AddNewExpenseScreen> createState() => _AddNewExpenseScreenState();
}

class _AddNewExpenseScreenState extends State<AddNewExpenseScreen> {

  TextEditingController categoryNameController = TextEditingController();
  FocusNode? categoryNameFn;


  @override
  void initState() {
    super.initState();
    categoryNameFn = FocusNode();
  }


  @override
  void dispose() {
    categoryNameFn!.dispose();
    categoryNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: buildCustomAppBar(
        centerTitle: true,
        context: context,
        trailing: const SizedBox(),
        title: 'ADD NEW EXPENSE'
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 16
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: SizeConfig.screenHeight! * 0.08,),
              buildTextField(hint: 'NAME OF CATEGORY',
              nextFocus: categoryNameFn,
              focusNode: categoryNameFn,
              controller: categoryNameController),
              const SizedBox(height: 20,),
              buildAddNewCategoryBtn()
            ],
          ),

        ),
      ),
    );
  }

  buildTextField(
      {String? hint,
        TextEditingController? controller,
        FocusNode? focusNode,
        FocusNode? nextFocus}) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (value) {
        focusNode!.unfocus();
      },
      obscureText:false,
      keyboardType:TextInputType.text,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: green219653, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: green219653, width: 1)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.red, width: 1)),
          hintText: hint,
          hintStyle: GoogleFonts.inter(
              fontSize: 16, fontWeight: FontWeight.w400, color: grey91919F),
      isDense: true),
      cursorColor: green219653,
    );
  }

  buildAddNewCategoryBtn(){
    return MaterialButton(
      onPressed: () {
        Navigator.pushNamed(context, routeExpenseDetails);
      },
      color: green219653,
      minWidth: SizeConfig.screenWidth,
      height: SizeConfig.blockSizeVertical! * 7.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: const Text(
        'ADD NEW CATEGORY',
        style: TextStyle(
            color: whiteF7f7f7, fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }
}
