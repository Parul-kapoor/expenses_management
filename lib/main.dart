import 'package:expenses_management/Constants/Constant.dart';
import 'package:expenses_management/Screens/Home/AddNewGallery.dart';
import 'package:expenses_management/Screens/Home/ExpenseDetails.dart';
import 'package:expenses_management/Screens/Home/Home.dart';
import 'package:expenses_management/Screens/Login/Login.dart';
import 'package:expenses_management/Screens/MainScreen.dart';
import 'package:expenses_management/Screens/Onboarding/Onboarding.dart';
import 'package:expenses_management/Screens/Profile/Profile.dart';
import 'package:expenses_management/Screens/ScreenList.dart';
import 'package:expenses_management/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Screens/Home/AddNewExpense.dart';
import 'Screens/SignUp/SignUp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenser',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme
        )
      ),
      home: const SplashScreen(),
      routes: {
        routeLogin : (context) => const LoginScreen(),
        routeSignup : (context) => const SignUpScreen(),
        routeMainScreen : (context) => const MainScreen(),
        routeAddExpense : (context) => const AddNewExpenseScreen(),
        routeAddGallery : (context) => const AddNewGalleryScreen(),
        routeHome : (context) => const HomeScreen(),
        routeProfile : (context) => const ProfileScreen(),
        routeExpenseDetails : (context) => const ExpenseDetails(),
      },
    );
  }
}
