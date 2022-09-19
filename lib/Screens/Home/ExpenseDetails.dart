import 'package:expenses_management/Constants/Colors.dart';
import 'package:expenses_management/Constants/Constant.dart';
import 'package:expenses_management/Screens/Home/NewExpense.dart';
import 'package:expenses_management/Utils/CommonWidgets.dart';
import 'package:expenses_management/Utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpenseDetails extends StatefulWidget {
  const ExpenseDetails({Key? key}) : super(key: key);

  @override
  State<ExpenseDetails> createState() => _ExpenseDetailsState();
}

class _ExpenseDetailsState extends State<ExpenseDetails> {

  List<String> shoppingCategoryList = ['Buying Fruits','Grocery','Drinks','Ice creams','Buying Fruits','Buying Fruits'];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(child:SingleChildScrollView(
        child: Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xffFFF6E5),
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: SizeConfig.screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Image.asset(iconArrowBack,width: 24),
                    iconSize: 20,),
                    Text(strShopping,style: GoogleFonts.inter(
                        fontSize: 40,
                      fontWeight: FontWeight.w600
                    ),),
                    IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const NewExpense()));
                    }, icon: const Icon(Icons.add),
                      iconSize: 24,),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              buildTotalExpensesBtn(),
              const SizedBox(height: 20,),
              buildListView(),

            ],
          ),
        ),
      )),
    );
  }

  buildTotalExpensesBtn(){
    return Container(
      width: SizeConfig.screenWidth,
      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: redFD3C4A,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.center,
            child: Image.asset(iconExpense,width: 50,height: 40,),
          ),
          SizedBox(width: SizeConfig.blockSizeHorizontal! * 5,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(strTotalExpenses,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14
              ),),
              SizedBox(height: SizeConfig.blockSizeVertical!,),
              Text('CAD 1200',
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 22
                ),)
            ],
          ),
        ],
      ),
    );
  }

  buildListView(){
    return ListView.builder(itemBuilder: (context,index){
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[100]!,
                  spreadRadius: 3.0,
                  blurRadius: 3.0
              )
            ]
        ),
        padding: const EdgeInsets.symmetric(
            vertical: 16,horizontal: 12
        ),
        margin: const EdgeInsets.only(
            bottom: 10
        ),
        width: SizeConfig.screenWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(shoppingCategoryList[index],
              style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('CAD 20',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: redFD3C4A
                  ),),
                const SizedBox(height: 10,),
                Text('10:00 AM',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: grey91919F
                  ),),
              ],
            ),
          ],
        ),
      ); },
    primary: false,
    shrinkWrap: true,
    itemCount: shoppingCategoryList.length,);
  }
}
