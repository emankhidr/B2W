import 'package:b2w/views/select_screen/select-screen.dart';
import 'package:b2w/views/splash/splash_screen.dart';
import 'package:b2w/views/user/home_page/home_page_screen.dart';
import 'package:b2w/views/user/job_screen/applied_jobs.dart';
import 'package:b2w/views/user/job_screen/applying1_screen.dart';
import 'package:b2w/views/user/nav_bar/nav_bar.dart';
import 'package:b2w/views/user/user_profile_setup/profile_setup_card.dart';
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
        home:NavBarScreen(),
        theme: ThemeData(

          fontFamily: 'Roboto'  ,
          appBarTheme: AppBarTheme(
            color:AppColors.white,
            elevation: 0.0,
            shadowColor: AppColors.white,
            scrolledUnderElevation: 0,

          ),
          scaffoldBackgroundColor: AppColors.white,

        ),
        debugShowCheckedModeBanner: false,
      ),
    );

  }
}