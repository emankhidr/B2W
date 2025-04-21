
import 'package:b2w/views/user/chats_screen/chats_screen.dart';
import 'package:b2w/views/user/home_page/home_page_screen.dart';
import 'package:b2w/views/user/home_page/share_post_screen.dart';
import 'package:b2w/views/user/job_screen/applied_jobs.dart';
import 'package:b2w/views/user/job_screen/job_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/colors.dart';


class NavBarScreen extends StatefulWidget {
  const NavBarScreen ({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [
    HomePageScreen(),
    JobScreen(),
    SharePostScreen(),
    ChatsScreen(),
    AppliedJobs(),
  ];


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0, -6),
              blurRadius: 10,
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _tab(imagePath: 'assets/images/Home.png', title: 'Home', index: 0),
              _tab(imagePath: 'assets/images/Jobs.png',title: 'Jobs', index: 1),
              _middleButton(),
              _tab(imagePath: 'assets/images/chats.png',title: 'Chats', index: 3, badgeCount: 3),
              _tab(imagePath: 'assets/images/Applied.png', title: 'Applied', index: 4),
            ],
          ),
        ),
      ),
    );
  }


  Widget _tab({
    required String imagePath,
    required String title,
    required int index,
    int badgeCount = 0,
  }) {
    final bool isSelected = currentIndex == index;

    return Expanded(
      child: InkWell(
        onTap: () => setState(() => currentIndex = index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Image.asset(
                    imagePath,
                    height: 22,
                    width: 25,
                    color: isSelected ?  AppColors.primary :AppColors.grey,),
                if (badgeCount > 0)
                  Positioned(
                    right: 0,
                    top: -2,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white,
                      ),
                      child: Text(
                        badgeCount.toString(),
                        style: const TextStyle(color: AppColors.grey, fontSize: 10),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected ? AppColors.primary :AppColors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _middleButton() {
    return InkWell(
      onTap: () => setState(() => currentIndex = 2),
      child: Container(
        height: 54,
        width: 54,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color:AppColors.primary,
        ),
        child: const Center(
          child: Icon(Icons.add, size: 32, color: Colors.white),
        ),
      ),
    );
  }
}
