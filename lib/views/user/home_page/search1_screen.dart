import 'package:b2w/core/route_Units/route_units.dart';
import 'package:b2w/core/utils/colors.dart';
import 'package:b2w/views/user/home_page/search2_screen.dart';
import 'package:b2w/widget/app/app_text.dart';
import 'package:b2w/widget/app/person_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Search1Screen extends StatelessWidget {
  const Search1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(Icons.arrow_back_ios, color: AppColors.black, size: 40,),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),

        actions: [
          GestureDetector(
            onTap: (){
              RouteUtils.push(context, Search2Screen());
            },
            child: Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: Container(
               width: 300.w,
                height: 42.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.lightPrimary,
                    width: 2.w
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.search_sharp,
                        size: 24,
                        color: AppColors.primary,),
                      SizedBox(
                        width: 8.w,
                      ),
                      AppText(title: 'Search',color: AppColors.grey,fontSize: 18,fontWeight: FontWeight.w400,),
                      Spacer(),
                      Icon(Icons.mic_none_rounded,
                        size: 20,
                        color: AppColors.grey,),

                    ],
                  ),
                ),
              ),
            ),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.alarm_on_sharp,color: AppColors.grey,size: 18,),
                SizedBox(
                  width: 4.w,
                ),
                AppText(title: 'Recent', fontSize: 18,fontWeight: FontWeight.w400,color: AppColors.grey,)
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                PersonCard(imagePath: 'assets/images/img 7.png', name: 'Murad Mohamed', role: 'Product manager', onRemove: (){}),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                PersonCard(imagePath: 'assets/images/img 8.png', name: 'Albert Flores', role: 'President of Sales', onRemove: (){}),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                PersonCard(imagePath: 'assets/images/img 9.png', name: 'Darrell Steward', role: 'Marketing Coordinator', onRemove: (){}),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),

          ],
        ),
      ),
    );
  }
}
