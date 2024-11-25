import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppLottie extends StatelessWidget {

  final String assetName;
  final double? width,height;

  const AppLottie({Key? key, required this.assetName, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset('assets/lottie/$assetName', width: width,height: height,fit: BoxFit.cover);
  }
}