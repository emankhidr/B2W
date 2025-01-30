import 'dart:async';

import 'package:b2w/core/extentions/string.dart';
import 'package:b2w/views/splash/splash_screen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/route_Units/route_units.dart';
import '../../core/utils/colors.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {


  @override
  void initState() {
    Timer(Duration(seconds: 1), (){
      RouteUtils.pushAndRemoveAll(context, SplashScreen2());

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'Splash screen 1'.assetPNG,
            ),
          ],
        ),
      ),

    );
  }
}
