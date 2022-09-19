import 'package:expenses_management/Constants/Colors.dart';
import 'package:expenses_management/Constants/Constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

buildCustomAppBar({String? title, Widget? trailing,BuildContext? context,bool? centerTitle}){
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: centerTitle,
    elevation: 0.0,
    title: Text(title!,
    style: GoogleFonts.inter(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: black212325,
    )),
    leading: IconButton(onPressed: (){
      Navigator.pop(context!);
    },

        icon: Image.asset(iconArrowBack,width: 24,height: 16,),
    color: black212325,),
    actions: [
      trailing!
    ],
  );
}