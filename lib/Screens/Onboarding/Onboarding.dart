import 'package:expenses_management/Constants/Colors.dart';
import 'package:expenses_management/Constants/Constant.dart';
import 'package:expenses_management/Utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {

  int current = 0;
  final CarouselSliderController _sliderController = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
          backgroundColor: backgroundColor,
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal! * 2,
                vertical: SizeConfig.blockSizeVertical!
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: SizeConfig.screenHeight! * 0.15,),
                  // CarouselSlider(items: [
                  //   for(int i=0;i<=2;i++)
                  //     buildOnboardPage(imgOnboard, strGainTotalControl, strBecomeYourOwnMoney)
                  // ], options: CarouselOptions(
                  //   autoPlay: false,
                  //   height: SizeConfig.screenHeight! * 0.58,
                  //   enableInfiniteScroll: false,
                  //   enlargeCenterPage: true,
                  //   viewportFraction: 0.8,
                  //   reverse: false,
                  //   onPageChanged: (index, reason) {
                  //     setState(() {
                  //     current = index;
                  //     });}
                  // )),
                  SizedBox(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight! * 0.6,
                    child: CarouselSlider.builder(
                      unlimitedMode: true,
                      controller: _sliderController,
                      slideBuilder: (index) {
                        return Container(
                          alignment: Alignment.center,
                          child: buildOnboardPage(imgOnboard, strGainTotalControl, strBecomeYourOwnMoney)
                        );
                      },
                      slideTransform: const ForegroundToBackgroundTransform(),
                      slideIndicator: CircularSlideIndicator(
                        currentIndicatorColor: green219653,
                        indicatorBackgroundColor: grey91919F,
                        padding: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical! * 2.5,),
                        indicatorBorderColor: Colors.white,
                      ),
                      itemCount: 3,
                      initialPage: 0,
                      enableAutoSlider: true,
                    ),
                  ),
                  MaterialButton(onPressed: (){
                    Navigator.pushNamed(context, routeSignup);
                  },
                  color: green219653,
                  minWidth: SizeConfig.screenWidth! * 0.85,
                    height: SizeConfig.blockSizeVertical! * 6.5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Text(strSignup,
                  style: TextStyle(
                    color: whiteF7f7f7,
                    fontSize: SizeConfig.blockSizeVertical! * 2,
                    fontWeight: FontWeight.w600
                  ),),),
                  SizedBox(height: SizeConfig.blockSizeVertical! ,),
                  MaterialButton(onPressed: (){
                    Navigator.pushNamed(context, routeLogin);
                  },
                    color: whiteF2f2f2,
                    minWidth: SizeConfig.screenWidth! * 0.85,
                    height: SizeConfig.blockSizeVertical! * 6.5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Text(strLogin,
                      style: TextStyle(
                          color: green219653,
                          fontSize: SizeConfig.blockSizeVertical! * 2,
                          fontWeight: FontWeight.w600
                      ),),)
                ],
              ),
            ),
          ),
        ));
  }

  buildOnboardPage(String image,String header, String subtitle){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(image),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal!,
              vertical: SizeConfig.blockSizeVertical!
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(header,
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                    color: black212325
                ),textAlign: TextAlign.center,),
              SizedBox(height: SizeConfig.blockSizeVertical!,),
              Text(subtitle,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: grey91919F
                ),textAlign: TextAlign.center,)
            ],
          ),
        ),
      ],
    );
  }
}
