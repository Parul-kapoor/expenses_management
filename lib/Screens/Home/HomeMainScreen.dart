import 'package:expenses_management/Constants/Colors.dart';
import 'package:expenses_management/Constants/Constant.dart';
import 'package:expenses_management/Utils/SizeConfig.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({Key? key}) : super(key: key);

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  String selectedMonth = 'Jan';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xffFFF6E5),
            Colors.white,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTitleBar(),
              buildTotalExpensesTillDay(),
              buildExpensesThisMonth(),
              buildSpendFrequency(),
              buildTabLayout()
            ],
          ),
        ),
      )),
    );
  }

  buildTitleBar() {
    return SizedBox(
      width: SizeConfig.screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, routeProfile);
            },
            child: Container(
                width: SizeConfig.blockSizeHorizontal! * 10,
                height: SizeConfig.blockSizeVertical! * 6,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.pink,
                  border: Border.all(color: Colors.white),
                ),
                child: Image.asset(
                  iconProfile,
                  fit: BoxFit.cover,
                  color: Colors.white,
                )),
          ),
          Container(
              alignment: Alignment.center,
              width: SizeConfig.screenWidth! * 0.25,
              child: DropdownButton<String>(
                underline: const SizedBox(),
                items: months.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: selectedMonth,
                isDense: true,
                borderRadius: BorderRadius.circular(10),
                onChanged: (value) {
                  setState(() {
                    selectedMonth = value!;
                  });
                },
              )),
          IconButton(onPressed: () {}, icon: Image.asset(iconNotification)),
        ],
      ),
    );
  }

  buildTotalExpensesTillDay() {
    return Container(
      width: SizeConfig.screenWidth,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            strTotalExpensesTillDate,
            style: GoogleFonts.inter(
                color: grey91919F, fontSize: 14, fontWeight: FontWeight.w500),
          ),
          Text(
            'CAD 9400',
            style: GoogleFonts.inter(
                color: black161719, fontSize: 40, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  buildExpensesThisMonth() {
    return Container(
      width: SizeConfig.screenWidth,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: redFD3C4A,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.center,
            child: Image.asset(
              iconExpense,
              width: 50,
              height: 40,
            ),
          ),
          SizedBox(
            width: SizeConfig.blockSizeHorizontal! * 5,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                strTotalExpenses,
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical!,
              ),
              Text(
                'CAD 1200',
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 22),
              )
            ],
          ),
        ],
      ),
    );
  }

  buildSpendFrequency() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: SizeConfig.screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            strSpendFrequency,
            style: GoogleFonts.inter(
                color: black0D0E0F, fontWeight: FontWeight.w600, fontSize: 18),
          ),
          Image.asset(imgGraph),
        ],
      ),
    );
  }

  Widget _splineChart() {
    return LineChart(
      LineChartData(
          // read about it in the LineChartData section
          ),
      swapAnimationDuration: Duration(milliseconds: 150), // Optional
      swapAnimationCurve: Curves.linear, // Optional
    );
  }

  buildTabLayout() {
    return DefaultTabController(
      length: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: TabBar(
              tabs: [
                Tab(
                  text: "Today",
                ),
                Tab(text: "Week"),
                Tab(text: "Month"),
                Tab(text: "Year"),
              ],
              indicator: BoxDecoration(
                color: pinkFCEED4,
                borderRadius: BorderRadius.circular(20),
              ),
              isScrollable: false,
              unselectedLabelColor: grey91919F,
              labelColor: yellowFCAC12,
            ),
          ),
          SizedBox(
            //Add this to give height
            height: SizeConfig.screenHeight! * 0.6,
            child: TabBarView(children: [
              Container(
                child: buildRecentTransactions(),
              ),
              Container(
                child: buildRecentTransactions(),
              ),
              Container(
                child: Text("Monthly view"),
              ),
              Container(
                child: Text("Yearly view"),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  buildRecentTransactions() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: SizeConfig.blockSizeVertical,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Transactions',
              style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: black292B2D),
            ),
            Container(
              decoration: BoxDecoration(
                  color: greyEEE5FF, borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.all(8),
              child: Text(
                'See All',
                style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: green219653),
              ),
            ),
          ],
        ),
        for(int i=0;i<=4;i++)
          ListTile(
            leading: Container(
              decoration: BoxDecoration(
                color: pinkFCEED4,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(5),
              child: Image.asset(iconShopping),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Shopping',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: black292B2D
                ),),
                Text('CAD 120',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: redFD3C4A
                  ),),
              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Some fruits',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: grey91919F
                  ),),
                Text('10:00 AM',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: grey91919F
                  ),),
              ],
            ),
          ),
      ],
    );
  }
}
