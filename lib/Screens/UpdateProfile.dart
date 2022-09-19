import 'package:expenses_management/Utils/CommonWidgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constants/Colors.dart';
import '../Utils/SizeConfig.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  FocusNode? nameFn;
  FocusNode? emailFn;
  FocusNode? pwdFn;

  bool obscure = true;
  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();


  @override
  void initState() {
    nameFn = FocusNode();
    emailFn = FocusNode();
    pwdFn = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    nameFn!.dispose();
    emailFn!.dispose();
    pwdFn!.dispose();
    nameController.dispose();
    emailController.dispose();
    pwdController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: buildCustomAppBar(
        centerTitle: true,
        title: 'PROFILE',
        trailing: const SizedBox(),
        context: context
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 16,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: SizeConfig.screenHeight! * 0.05,),
                  Form(
                      key: signUpKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildTextField(
                              hint: 'Name',
                              focusNode: nameFn,
                              nextFocus: emailFn,
                              controller: nameController),
                          const SizedBox(
                            height: 24,
                          ),
                          buildTextField(
                              hint: 'Email',
                              focusNode: emailFn,
                              nextFocus: pwdFn,
                              controller: emailController),
                          const SizedBox(
                            height: 24,
                          ),
                          buildTextField(
                              hint: 'Password',
                              focusNode: pwdFn,
                              nextFocus: pwdFn,
                              controller: pwdController),
                          const SizedBox(
                            height: 24,
                          ),
                          buildSignUpBtn(),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ))
                ],
              ),
            ),
          )),
    );
  }

  buildTextField(
      {String? hint,
        TextEditingController? controller,
        FocusNode? focusNode,
        FocusNode? nextFocus}) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      textInputAction:
      hint == 'Password' ? TextInputAction.done : TextInputAction.next,
      onFieldSubmitted: (value) {
        if (hint == 'Password') {
          focusNode!.unfocus();
        } else {
          focusNode!.unfocus();
          FocusScope.of(context).requestFocus(nextFocus);
        }
      },
      obscureText: hint == 'Password' ? obscure : false,
      keyboardType:
      hint == 'Email' ? TextInputType.emailAddress : TextInputType.text,
      decoration: InputDecoration(
          suffixIcon: hint == 'Password' ? IconButton(icon:Icon(obscure ? Icons.visibility_off : Icons.visibility,color: Colors.grey), onPressed: () { setState((){
            obscure = !obscure;
          }); },) : null,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: green219653, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: green219653, width: 1)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.red, width: 1)),
          hintText: hint,
          hintStyle: GoogleFonts.inter(
              fontSize: 16, fontWeight: FontWeight.w400, color: grey91919F),
          isDense: true),
      cursorColor: green219653,
    );
  }

  buildSignUpBtn() {
    return MaterialButton(
      onPressed: () {
        Navigator.pop(context);
      },
      color: purple7F3DFF,
      minWidth: SizeConfig.screenWidth,
      height: SizeConfig.blockSizeVertical! * 6.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: const Text(
        'Update Profile',
        style: TextStyle(
            color: whiteF7f7f7, fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }
}
