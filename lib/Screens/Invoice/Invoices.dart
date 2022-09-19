import 'package:expenses_management/Constants/Colors.dart';
import 'package:expenses_management/Constants/Constant.dart';
import 'package:expenses_management/Screens/Invoice/AddNewInvoice.dart';
import 'package:expenses_management/Screens/Invoice/InvoiceDetails.dart';
import 'package:expenses_management/Utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Invoices extends StatefulWidget {
  const Invoices({Key? key}) : super(key: key);

  @override
  State<Invoices> createState() => _InvoicesState();
}

class _InvoicesState extends State<Invoices> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildAppBar(),
                const SizedBox(
                  height: 20,
                ),
                buildList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildAppBar() {
    return Container(
      width: SizeConfig.screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              iconArrowBack,
              width: 24,
              height: 24,
            ),
          ),
          Text(
            'Invoices'.toUpperCase(),
            style: GoogleFonts.inter(fontSize: 40, fontWeight: FontWeight.w600),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddNewInvoice()));
              },
              icon: const Icon(Icons.add)),
        ],
      ),
    );
  }

  buildList() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          elevation: 2.0,
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          margin: const EdgeInsets.only(bottom: 10),
          child: ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const InvoiceDetails()));
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            contentPadding: const EdgeInsets.all(16),
            title: Text(
              'Deisel Invoice'.toUpperCase(),
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
      itemCount: 4,
      shrinkWrap: true,
      primary: false,
    );
  }
}
