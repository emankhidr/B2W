import 'package:b2w/views/on_boarding/welcome.dart';
import 'package:b2w/views/splash/splash_screen0.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/utils/colors.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        home: SplashScreen0(),
        theme: ThemeData(

          fontFamily: 'Roboto'  ,
          appBarTheme: AppBarTheme(
            color:AppColors.white,
            elevation: 0.0,
            shadowColor: AppColors.white,
            scrolledUnderElevation: 0,
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );

  }
}