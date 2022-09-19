import 'package:expenses_management/Constants/Constant.dart';
import 'package:expenses_management/Utils/CommonWidgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constants/Colors.dart';
import '../Utils/SizeConfig.dart';

class ExportData extends StatefulWidget {
  const ExportData({Key? key}) : super(key: key);

  @override
  State<ExportData> createState() => _ExportDataState();
}

class _ExportDataState extends State<ExportData> {
  List<String> question1 = ['All', 'Value1', 'Value2', 'Value3'];
  List<String> question2 = [
    'Last 30 Days',
    'Last 3 Months',
    'Last 6 Months',
    'More than 1 year'
  ];
  List<String> question3 = ['CSV', 'XLSX', 'Other'];

  String question1Value = 'All';
  String question2Value = 'Last 30 Days';
  String question3Value = 'CSV';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: buildCustomAppBar(
          title: 'Export Data',
          centerTitle: true,
          context: context,
          trailing: const SizedBox()),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildDropDownWidget(
                    question: 'What data do your want to export?',
                    qList: question1,
                    value: question1Value),
                const SizedBox(
                  height: 30,
                ),
                buildDropDownWidget(
                    question: 'When date range?',
                    qList: question2,
                    value: question2Value),
                const SizedBox(
                  height: 30,
                ),
                buildDropDownWidget(
                    question: 'What format do you want to export?',
                    qList: question3,
                    value: question3Value),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.2,
                ),
                buildMaterialBtn(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildDropDownWidget({String? question, List<String>? qList, String? value}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question!,
          style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 20,
        ),
        DropdownButtonFormField<String>(
          items: qList!.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: GoogleFonts.inter(color: Colors.black),
              ),
            );
          }).toList(),
          icon: Image.asset(
            iconDropDownArrow,
            width: 20,
            height: 20,
          ),
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: greyF1F1FA)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: greyF1F1FA)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: greyF1F1FA))),
          value: value,
          onChanged: (value) {
            setState(() {
              value = value!;
            });
          },
        ),
      ],
    );
  }

  buildMaterialBtn() {
    return MaterialButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DataExported()));
      },
      color: green219653,
      minWidth: SizeConfig.screenWidth,
      height: SizeConfig.blockSizeVertical! * 6.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.download_rounded,
            color: Colors.white,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Export',
            style: TextStyle(
                color: whiteF7f7f7, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

//data exported

class DataExported extends StatelessWidget {
  const DataExported({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Center(
                child: Image.asset(
              imgIllustration,
              height: MediaQuery.of(context).size.height * 0.25,
            )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                  "Check your email, we send you the financial report. In certain cases, it might take a little longer, depending on the time period and the volume of activity.",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500
              ),),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            buildMaterialBtn(context),
          ],
        ),
      ),
    );
  }

  buildMaterialBtn(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: MaterialButton(
        onPressed: () {
          Navigator.pop(context);
        },
        color: green219653,
        minWidth: SizeConfig.screenWidth,
        height: SizeConfig.blockSizeVertical! * 6.5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: const Text(
          'Back to Home',
          style: TextStyle(
              color: whiteF7f7f7, fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
