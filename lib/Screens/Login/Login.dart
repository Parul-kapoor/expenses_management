import 'package:expenses_management/Constants/Colors.dart';
import 'package:expenses_management/Constants/Constant.dart';
import 'package:expenses_management/Utils/CommonWidgets.dart';
import 'package:expenses_management/Utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  GlobalKey<FormState> loginForm = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  FocusNode? emailFn;
  FocusNode? pwdFn;

  bool obscure = true;

  @override
  void initState() {
    emailFn = FocusNode();
    pwdFn = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    emailFn!.dispose();
    pwdFn!.dispose();
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
        trailing: SizedBox(),
        context: context,
        centerTitle: true,
        title: 'Login'
      ),
      body: SafeArea(child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: SizeConfig.screenHeight! * 0.08,),
              Form(
                key: loginForm,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTextField(
                      controller: emailController,
                      hint: 'Email',
                      nextFocus: pwdFn,
                      focusNode: emailFn
                    ),
                    const SizedBox(height: 20,),
                    buildTextField(
                      controller: pwdController,
                      focusNode: pwdFn,
                      nextFocus: pwdFn,
                      hint: 'Password'
                    ),
                    const SizedBox(height: 20,),
                    buildLoginBtn(),
                    const SizedBox(height: 20,),
                    Container(
                      width: SizeConfig.screenWidth,
                      alignment: Alignment.center,
                      child: Text('Forgot Password?',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: green4CAF50
                      ),),
                    ),
                    const SizedBox(height: 20,),
                    InkWell(
                      onTap: (){
                        Navigator.pushReplacementNamed(context, routeSignup);
                      },
                      child: Container(
                          width: SizeConfig.screenWidth,
                          alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(text: 'Don’t have an account yet? ',
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: grey91919F
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Signup',
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
                ),
              )

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

  buildLoginBtn(){
    return MaterialButton(
      onPressed: () {
        Navigator.pushNamed(context, routeMainScreen);
      },
      color: green219653,
      minWidth: SizeConfig.screenWidth,
      height: SizeConfig.blockSizeVertical! * 6.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: const Text(
        'Login',
        style: TextStyle(
            color: whiteF7f7f7, fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }
}
