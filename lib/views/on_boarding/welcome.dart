import 'package:b2w/core/extentions/string.dart';
import 'package:b2w/core/route_Units/route_units.dart';
import 'package:b2w/views/Login/login_screen.dart';
import 'package:b2w/widget/app/app_buttons.dart';
import 'package:b2w/widget/app/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/colors.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Widget dotPageView(){
    return Builder(builder: (context){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i =0 ; i<4 ; i++)

            Container(

              decoration: BoxDecoration(
                color: i == pageNumber? AppColors.primary : AppColors.grey,
                borderRadius: BorderRadius.circular(60),

              ),
              width: i == pageNumber? 14:10,
              height: 10,
              margin: EdgeInsets.symmetric(
                horizontal: 5,
              ),
            ),
        ],
      );
    });
  }
  PageController  nextPage = PageController();
   int pageNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: (){
                RouteUtils.pushAndRemoveAll(context, LoginScreen());
              }
              ,
              child: AppText(title: 'Skip',
                color: AppColors.primary,
                decoration: TextDecoration.underline,
               fontSize: 16,
             ),
            ),
          ],
        ),
      ),
      body:PageView(
        controller: nextPage ,
        onPageChanged: (value){
         setState(() {
           pageNumber = value;
         });
        },
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Image.asset('Hello-pana 1'.assetPNG),
                Center(
                  child: AppText(title: 'Welcome To',
                    color: AppColors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                      fontFamily: 'Lato'
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(title: '”',
                      color: AppColors.primary,
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                    AppText(title: 'Bridge To Work',
                      color: AppColors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                        fontFamily: 'Lato'
                    ),
                    AppText(title: '”',
                      color: AppColors.primary,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: AppText(title: 'Your ultimate platform for social connections, career \n '
                      'opportunities, and personal growth.',
                    color: AppColors.extraDark,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    textAlign: TextAlign.center,),
                ),
                SizedBox(
                  height: 32.h,
                ),
                dotPageView(),

                SizedBox(
                  height: 32.h,
                ),
                AppButton(title: 'Continue',
                  onTap: (){
                    nextPage.animateToPage(1, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                  },
                ),


              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(

              children: [
                Image.asset('Resume-amico 2'.assetPNG),
                Center(
                  child: AppText(title: 'Find Your Dream \n Job',
                    color: AppColors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.center,
                    fontFamily: 'Lato',
                  ),
                ),

                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: AppText(title: 'Discover tailored job opportunities and connect with \n inclusive employers.',
                    color: AppColors.extraDark,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    textAlign: TextAlign.center,),
                ),
                SizedBox(
                  height: 32.h,
                ),
                dotPageView(),

                SizedBox(
                  height: 32.h,
                ),
                AppButton(title: 'Continue',
                  onTap: (){
                    nextPage.animateToPage(2, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                  },
                ),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Image.asset('Career progress-cuate 2'.assetPNG),
                Center(
                  child: AppText(title: 'Boost Your Skills \n with AI',
                    color: AppColors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.center,
                    fontFamily: 'Lato',
                  ),
                ),

                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: AppText(title: 'Get personalized career advice, skill enhancement \n tips, and resume optimizations powered by AI.',
                    color: AppColors.extraDark,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    textAlign: TextAlign.center,),
                ),
                SizedBox(
                  height: 32.h,
                ),
                dotPageView(),

                SizedBox(
                  height: 32.h,
                ),
                AppButton(title: 'Continue',
                  onTap: (){
                  nextPage.animateToPage(3, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Image.asset('New notifications-pana (1) 1'.assetPNG),
                Center(
                  child: AppText(title: 'Connect & Share',
                    color: AppColors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.center,
                    fontFamily: 'Lato',
                  ),
                ),

                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: AppText(title: 'Join a vibrant community, share experiences, and \n network with others through our integrated social \n media features.',
                    color: AppColors.extraDark,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    textAlign: TextAlign.center,),
                ),
                SizedBox(
                  height: 32.h,
                ),
                dotPageView(),

                SizedBox(
                  height: 32.h,
                ),
                AppButton(title: 'Get Started',
                  onTap: (){
                    RouteUtils.pushAndRemoveAll(context, LoginScreen());
                  },
                ),
              ],
            ),
          ),


        ],
      )
    );
  }
}
