import 'dart:async';

import 'package:edu_c/utils/helper/help_screensize.dart';
import 'package:edu_c/utils/helper/pagenavigator.dart';
import 'package:edu_c/utils/theme/colors.dart';
import 'package:edu_c/view/components/apptext.dart';
import 'package:edu_c/view/pages/home/homepage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    initpage();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: Container(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        decoration: BoxDecoration(
          gradient: ColorResources.splashgradient
        ),
        child: Center(
          child: AppText(text: 'Edu.C',weight: FontWeight.w500,letterspace: 0.8,size: 25,color: ColorResources.WHITE,),
        ),
      ),
    );
  }
  initpage() async{
    Timer(const Duration(seconds: 2), () {
      Screen.openAsNewPage(context, const HomeScreen());
    },);
  }
}