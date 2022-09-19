import 'package:expenses_management/Screens/Invoice/InvoiceDetails.dart';
import 'package:expenses_management/Screens/Invoice/Invoices.dart';
import 'package:expenses_management/Utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/Colors.dart';
import '../../Constants/Constant.dart';
import '../../Utils/CommonWidgets.dart';


class AddNewInvoice extends StatefulWidget {
  const AddNewInvoice({Key? key}) : super(key: key);

  @override
  State<AddNewInvoice> createState() => _AddNewInvoiceState();
}

class _AddNewInvoiceState extends State<AddNewInvoice> {

  TextEditingController categoryNameController = TextEditingController();
  TextEditingController columnController = TextEditingController();
  FocusNode? categoryNameFn;
  FocusNode? columnFn;


  @override
  void initState() {
    super.initState();
    categoryNameFn = FocusNode();
    columnFn = FocusNode();
  }


  @override
  void dispose() {
    categoryNameFn!.dispose();
    columnFn!.dispose();
    categoryNameController.dispose();
    columnController.dispose();
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
          title: 'ADD NEW INVOICE'
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
                  nextFocus: columnFn,
                  focusNode: categoryNameFn,
                  controller: categoryNameController),
              const SizedBox(height: 20,),
              buildTextField(hint: 'Number of columns',
                  nextFocus: columnFn,
                  focusNode: columnFn,
                  controller: columnController),
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
      textInputAction: focusNode == categoryNameFn ? TextInputAction.next : TextInputAction.done,
      onFieldSubmitted: (value) {
        if (focusNode == categoryNameFn) {
          focusNode!.unfocus();
          FocusScope.of(context).requestFocus(nextFocus);
        }
        else {
          focusNode!.unfocus();
        }
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
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Invoices()));
      },
      color: green219653,
      minWidth: SizeConfig.screenWidth,
      height: SizeConfig.blockSizeVertical! * 7.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: const Text(
        'ADD NEW INVOICE',
        style: TextStyle(
            color: whiteF7f7f7, fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }
}
