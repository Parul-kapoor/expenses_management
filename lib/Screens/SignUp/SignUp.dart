import 'package:expenses_management/Constants/Colors.dart';
import 'package:expenses_management/Constants/Constant.dart';
import 'package:expenses_management/Utils/CommonWidgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utils/SizeConfig.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  FocusNode? nameFn;
  FocusNode? emailFn;
  FocusNode? pwdFn;

  bool? agreeToTerms = false;
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
          title: 'Sign Up', trailing: const SizedBox(), context: context,
      centerTitle: true),
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
              SizedBox(height: SizeConfig.screenHeight! * 0.08,),
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
                        height: 20,
                      ),
                      buildTextField(
                          hint: 'Email',
                          focusNode: emailFn,
                          nextFocus: pwdFn,
                          controller: emailController),
                      const SizedBox(
                        height: 20,
                      ),
                      buildTextField(
                          hint: 'Password',
                          focusNode: pwdFn,
                          nextFocus: pwdFn,
                          controller: pwdController),
                      const SizedBox(
                        height: 20,
                      ),
                      buildCheckBox(),
                      const SizedBox(
                        height: 20,
                      ),
                      buildSignUpBtn(),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          width: SizeConfig.screenWidth,
                          alignment: Alignment.center,
                          child: Text(
                            'Or with',
                            style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: grey91919F),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      buildSignUpWithGoogle(),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.pushReplacementNamed(context, routeLogin);
                        },
                        child: Container(
                            width: SizeConfig.screenWidth,
                            alignment: Alignment.center,
                            child: RichText(
                              text: TextSpan(text: 'Already have an account? ',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: grey91919F
                              ),
                              children: [
                                TextSpan(
                                  text: 'Login',
                                  style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.underline,
                                      color: green219653),
                                )
                              ]),
                            )),
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

  buildCheckBox() {
    return CheckboxListTile(
      value: agreeToTerms,
      onChanged: (value) {
        setState(() {
          agreeToTerms = value;
        });
      },
      title: RichText(
          text: TextSpan(
              text: 'By signing up, you agree to the ',
              style: GoogleFonts.inter(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
              children: [
            TextSpan(
              text: 'Terms of Service ',
              style: GoogleFonts.inter(
                color: green219653,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            TextSpan(
              text: 'and ',
              style: GoogleFonts.inter(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            TextSpan(
              text: 'Privacy Policy ',
              style: GoogleFonts.inter(
                color: green219653,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ])),
      dense: true,
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: purple7F3DFF,
      checkColor: Colors.white,
      checkboxShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  buildSignUpBtn() {
    return MaterialButton(
      onPressed: () {
        Navigator.pushNamed(context, routeMainScreen);
      },
      color: green219653,
      minWidth: SizeConfig.screenWidth,
      height: SizeConfig.blockSizeVertical! * 6.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: const Text(
        'Sign up',
        style: TextStyle(
            color: whiteF7f7f7, fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }

  buildSignUpWithGoogle() {
    return MaterialButton(
      onPressed: () {},
      color: Colors.white,
      minWidth: SizeConfig.screenWidth,
      height: SizeConfig.blockSizeVertical! * 6.5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconGoogle,
          width: 32,height: 32,),
          const SizedBox(width: 10,),
          const Text(
            'Sign Up with Google',
            style: TextStyle(
                color: black212325, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
