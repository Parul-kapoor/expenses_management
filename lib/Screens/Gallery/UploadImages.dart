import 'package:expenses_management/Constants/Colors.dart';
import 'package:expenses_management/Utils/CommonWidgets.dart';
import 'package:expenses_management/Utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/Constant.dart';

class UploadImages extends StatefulWidget {
  const UploadImages({Key? key}) : super(key: key);

  @override
  State<UploadImages> createState() => _UploadImagesState();
}

class _UploadImagesState extends State<UploadImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: buildCustomAppBar(
        title: 'Upload Images',
        centerTitle: true,
        context: context,
        trailing: IconButton(onPressed: (){
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
          },shape: RoundedRectangleBorder(
            borderRadius:BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )
          ),);
        }, icon: const Icon(Icons.add),color: Colors.black,),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  runSpacing: 5,
                  children: [
                    for (int i = 0; i < 6; i++)
                      Container(
                          width: SizeConfig.screenWidth! * 0.27,
                          height: SizeConfig.screenHeight! * 0.13,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              'https://cdn.photographycourse.net/wp-content/uploads/2014/11/Landscape-Photography-steps.jpg',
                              fit: BoxFit.cover,
                            ),
                          )),
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
