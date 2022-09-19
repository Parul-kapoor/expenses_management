import 'package:expenses_management/Screens/Gallery/ADdNewGallery.dart';
import 'package:expenses_management/Screens/Gallery/UploadImages.dart';
import 'package:expenses_management/Utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/Colors.dart';
import '../../Constants/Constant.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 16,vertical: 20
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildAppBar(),
                buildList(),

              ],
            ),
          ),
        ),
      ),
    );
  }

  buildAppBar(){
    return Container(
      width: SizeConfig.screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Image.asset(iconArrowBack,width: 24,height: 24,),),
          Text('Gallery'.toUpperCase(),
            style: GoogleFonts.inter(
                fontSize: 40,
                fontWeight: FontWeight.w600
            ),),
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNewGallery()));
          }, icon:Icon(Icons.add)),
        ],
      ),
    );
  }

  buildList(){
    return ListView.builder(itemBuilder: (context,index){
      return Card(
        elevation: 2.0,
        color: Colors.white,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.only(bottom: 10),
        child: ListTile(
          onTap: () {},
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          contentPadding: const EdgeInsets.all(16),
          title: Text(
            'Deisel Gallery'.toUpperCase(),
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: black292B2D),
          ),
          trailing: Text(
            '10:00 AM'.toUpperCase(),
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w500, fontSize: 13, color: grey91919F),
          ),
        ),
      );
    },
    primary: false,
    shrinkWrap: true,
    itemCount: 5,);
  }
}

