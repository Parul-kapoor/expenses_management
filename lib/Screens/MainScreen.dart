import 'package:expenses_management/Constants/Constant.dart';
import 'package:expenses_management/Screens/Gallery/gallery.dart';
import 'package:expenses_management/Screens/Home/ExpenseDetails.dart';
import 'package:expenses_management/Screens/Home/Home.dart';
import 'package:expenses_management/Screens/Home/HomeMainScreen.dart';
import 'package:expenses_management/Screens/Invoice/Invoices.dart';
import 'package:expenses_management/Screens/Profile/Profile.dart';
import 'package:expenses_management/Utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constants/Colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget> [
    const HomeScreen(),
    const HomeMainScreen(),
    const Gallery(),
    const ProfileScreen(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 15),
        child: FloatingActionButton(onPressed: (){
          Navigator.pushNamed(context, routeAddExpense);
        },
        backgroundColor: green219653,
        mini: true,
        child: const Icon(Icons.add,color: Colors.white,),),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: purple7F3DFF,
        unselectedItemColor: grey91919F,
        selectedLabelStyle: GoogleFonts.inter(
            color: green219653,
            fontSize: 12,
        ),
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: GoogleFonts.inter(
            color: grey91919F,
            fontSize: 12
        ),
        items: const [
           BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(iconHome)),
            label: strHome,
          ),
           BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(iconInvoices)),
            label: 'Transactions',
          ),
           BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(iconGallery)),
            label: strGallery,
          ),
           BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(iconProfile)),
            label: strProfile,
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
