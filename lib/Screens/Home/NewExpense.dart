import 'package:expenses_management/Constants/Colors.dart';
import 'package:expenses_management/Constants/Constant.dart';
import 'package:expenses_management/Utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({Key? key}) : super(key: key);

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            decoration: const BoxDecoration(
              color: redFD3C4A,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Image.asset(
                          iconArrowBack,
                          width: 24,
                          color: Colors.white,
                        ),
                        iconSize: 24,
                      ),
                      SizedBox(
                        width: SizeConfig.screenWidth! * 0.2,
                      ),
                      Text(
                        strExpense,
                        style: GoogleFonts.inter(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight! * 0.15,
                  ),
                  Text(
                    strHowMuch,
                    style: GoogleFonts.inter(fontSize: 18, color: Colors.white),
                  ),
                  Row(
                    children: [
                      Text(
                        '\$',
                        style: GoogleFonts.inter(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 50),
                      ),
                      SizedBox(
                        width: SizeConfig.screenWidth! * 0.8,
                        child: TextFormField(
                          cursorColor: Colors.white,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 50,
                          ),
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '0',
                            labelStyle: GoogleFonts.inter(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 50,
                            ),
                            hintStyle: GoogleFonts.inter(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 50,
                            ),
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight! * 0.5,
            margin: EdgeInsets.only(top: SizeConfig.screenHeight! * 0.5),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    cursorColor: green219653,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: green219653, width: 1)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: green219653, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: green219653, width: 1)),
                      hintText: 'Description',
                      hintStyle: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    maxLines: 4,
                    maxLength: 100,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (value){
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    onPressed: () {
                      showModalBottomSheet(context: context, builder: (context){
                        return Wrap(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  )
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: SizeConfig.screenWidth ! * 0.25,
                                    height: 90,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: greyEEE5FF
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.camera_alt,color: green219653,),
                                        Text('Camera',
                                          style: GoogleFonts.inter(
                                              color: green219653
                                          ),)
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: SizeConfig.screenWidth ! * 0.25,
                                    height: 90,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: greyEEE5FF
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.image,color: green219653,),
                                        Text('Image',
                                          style: GoogleFonts.inter(
                                              color: green219653
                                          ),)
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: SizeConfig.screenWidth ! * 0.25,
                                    height: 90,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: greyEEE5FF
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.note_alt,color: green219653,),
                                        Text('Document',
                                          style: GoogleFonts.inter(
                                              color: green219653
                                          ),)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      });
                    },
                    minWidth: SizeConfig.screenWidth,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: grey91919F),
                    ),
                    elevation: 0.0,
                    padding: const EdgeInsets.all(16),
                    child: const Text(
                      'Add Attachment',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: green219653,
                    minWidth: SizeConfig.screenWidth,
                    height: SizeConfig.blockSizeVertical! * 7.5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                          color: whiteF7f7f7,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
