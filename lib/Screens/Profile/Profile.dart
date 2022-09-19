import 'package:expenses_management/Constants/Colors.dart';
import 'package:expenses_management/Constants/Constant.dart';
import 'package:expenses_management/Screens/ExportData.dart';
import 'package:expenses_management/Screens/UpdateProfile.dart';
import 'package:expenses_management/Utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Settings.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [buildProfileHeader(), buildMenuContainer()],
          ),
        ),
      )),
    );
  }

  buildProfileHeader() {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.zero,
        width: SizeConfig.screenWidth! * 0.15,
        height: SizeConfig.blockSizeVertical! * 6,
        decoration: const BoxDecoration(
          color: Colors.orange,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('assets/icons/Rectangle 9.png'),
          ),
        ),
      ),
      title: Text('Username',
          style: GoogleFonts.inter(
              color: grey91919F, fontSize: 14, fontWeight: FontWeight.w500)),
      subtitle: Text('Varun Kumar',
          style: GoogleFonts.inter(
              fontSize: 24, fontWeight: FontWeight.w600, color: black161719)),
      trailing: IconButton(
        onPressed: () {},
        icon: Image.asset(
          iconEdit,
          width: 24,
          height: 24,
        ),
      ),
    );
  }

  buildMenuContainer() {
    return Container(
        margin: EdgeInsets.only(top: SizeConfig.screenHeight! * 0.05),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[300]!, spreadRadius: 3.0, blurRadius: 3.0),
            ]),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildMenuListTile(title: strAccount, image: iconWallet,
            voidCallback: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const UpdateProfile()));
            }),
            const Divider(
              color: greyEEE5FF,
            ),
            buildMenuListTile(title: strSettings, image: iconSettings,
            voidCallback: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Settings()));
            }),
            const Divider(
              color: greyEEE5FF,
            ),
            buildMenuListTile(title: strExportData, image: iconUpload,
            voidCallback: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const ExportData()));
            }),
            const Divider(
              color: greyEEE5FF,
            ),
            buildMenuListTile(
                title: strLogout,
                image: iconLogout,
                voidCallback: () => showLogoutDialog()),
          ],
        ));
  }

  showLogoutDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: backgroundColor,
            alignment: Alignment.bottomCenter,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            actionsAlignment: MainAxisAlignment.spaceAround,
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                height: 50,
                minWidth: MediaQuery.of(context).size.width * 0.3,
                color: lightGreenE5FFEB,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                child: Text('No',
                style: GoogleFonts.inter(
                  color: green219653,
                  fontWeight: FontWeight.w400
                ),),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: green219653,
                height: 50,
                minWidth: MediaQuery.of(context).size.width * 0.3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                ),
                child: Text('Yes',
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w400
                  ),),
              )
            ],
            title: const Text(
              '$strLogout?',
              textAlign: TextAlign.center,
            ),
            content: Text(
              strAreYouSureLogout,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: grey91919F,
              ),
            ),
          );
        });
  }

  buildMenuListTile(
      {String? image, String? title, VoidCallback? voidCallback}) {
    return ListTile(
      contentPadding: const EdgeInsets.all(8),
      onTap: voidCallback,
      leading: Container(
        decoration: BoxDecoration(
            color: greyEEE5FF, borderRadius: BorderRadius.circular(5)),
        padding: const EdgeInsets.all(8),
        child: Image.asset(
          image!,
          width: 32,
          height: 32,
        ),
      ),
      title: Text(
        title!,
        style: GoogleFonts.inter(
            fontSize: 16, fontWeight: FontWeight.w500, color: black292B2D),
      ),
    );
  }
}
