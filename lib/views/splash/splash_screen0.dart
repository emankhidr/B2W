import 'dart:async';
import 'package:b2w/core/extentions/string.dart';
import 'package:b2w/core/utils/colors.dart';
import 'package:b2w/views/splash/splash_screen1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/route_Units/route_units.dart';

class SplashScreen0 extends StatefulWidget {
  const SplashScreen0({super.key});

  @override
  State<SplashScreen0> createState() => _SplashView0State();
}

class _SplashView0State extends State<SplashScreen0> {

  @override
  void initState() {
    Timer(Duration(seconds: 1), (){
      RouteUtils.pushAndRemoveAll(context, SplashScreen1());

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
              'Splash screen0'.assetPNG,
            ),

          ],
        ),
      ),
    );
  }
}
