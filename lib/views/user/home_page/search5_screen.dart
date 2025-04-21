import 'package:b2w/core/route_Units/route_units.dart';
import 'package:b2w/core/utils/colors.dart';
import 'package:b2w/views/user/home_page/search2_screen.dart';
import 'package:b2w/views/user/home_page/search3_screen.dart';
import 'package:b2w/views/user/home_page/search4_screen.dart';
import 'package:b2w/widget/app/app_text.dart';
import 'package:b2w/widget/app/nav_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Search5Screen extends StatelessWidget {
  const Search5Screen({super.key});

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
                      Icon(Icons.cancel_outlined,
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NavItem(label: "All", color:AppColors.white, page: Search2Screen()),
                NavItem(label: "Accounts", color: AppColors.white, page : Search3Screen()),
                NavItem(label: "Companies", color: AppColors.white, page: Search4Screen()),
                NavItem(label: "Tags", color: AppColors.primary, page: Search5Screen()),
              ],
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppText(title: 'Tags',color: AppColors.grey,fontWeight: FontWeight.w400,fontSize: 18,),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppText(title: '#   Elsie Cronin',color: Colors.blueAccent,fontWeight: FontWeight.w400,fontSize: 18,),
              ],
            ),
          ),
        ],
      )

    );
  }
}
