import 'package:expenses_management/Constants/Colors.dart';
import 'package:expenses_management/Screens/Home/AddNewExpense.dart';
import 'package:expenses_management/Screens/Home/AddNewGallery.dart';
import 'package:expenses_management/Screens/Login/Login.dart';
import 'package:expenses_management/Screens/MainScreen.dart';
import 'package:expenses_management/Screens/Onboarding/Onboarding.dart';
import 'package:expenses_management/Screens/Profile/Profile.dart';
import 'package:expenses_management/Screens/SignUp/SignUp.dart';
import 'package:flutter/material.dart';

import 'Home/ExpenseDetails.dart';
import 'Home/Home.dart';
import 'Home/NewExpense.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        shrinkWrap: true,
        primary: true,
        physics: BouncingScrollPhysics(),
        children: [
          ListTile(
            dense: true,
            title: const Text('On Boarding 1'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Onboard()));
            },
          ),
          ListTile(
            dense: true,
            title: const Text('Sign up'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
            },
          ),
          ListTile(
            dense: true,
            title: const Text('Login'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
            },
          ),
          ListTile(
            dense: true,
            title: const Text('Home'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
            },
          ),
          ListTile(
            dense: true,
            title: const Text('Add New Expense'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNewExpenseScreen()));
            },
          ),
          ListTile(
            dense: true,
            title: const Text('Add New Gallery'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNewGalleryScreen()));
            },
          ),
          ListTile(
            dense: true,
            title: const Text('Profile'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileScreen()));
            },
          ),
          ListTile(
            dense: true,
            title: const Text('Main Screen'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> MainScreen()));
            },
          ),
          ListTile(
            dense: true,
            title: const Text('Expense Details'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ExpenseDetails()));
            },
          ),
          ListTile(
            dense: true,
            title: const Text('New Expense'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> NewExpense()));
            },
          ),
        ],
      ),
    );
  }
}
