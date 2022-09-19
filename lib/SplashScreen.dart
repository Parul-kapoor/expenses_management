import 'dart:async';

import 'package:expenses_management/Screens/Onboarding/Onboarding.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Constants/Colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                Onboard()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green219653,
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 80,
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [yellowFCAC12, green219653],
            ),
          ),
          child: Text('EXPENSOR',style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 35,
            color: Colors.white
          ),),
        ),
      ),
    );
  }
}
