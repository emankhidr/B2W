import 'dart:async';
import 'package:b2w/core/extentions/string.dart';
import 'package:b2w/views/on_boarding/welcome.dart';
import 'package:flutter/material.dart';
import '../../core/route_Units/route_units.dart';
import '../../core/utils/colors.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  void initState() {
    Timer(Duration(seconds: 1), (){
      RouteUtils.pushAndRemoveAll(context,WelcomeScreen());

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
              'Splash screen 2'.assetPNG,
            ),
          ],
        ),
      ),
    );
  }
}
