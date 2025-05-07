import 'package:b2w/core/route_Units/route_units.dart';
import 'package:b2w/core/utils/colors.dart';
import 'package:b2w/views/user/user_profile/post_page.dart';
import 'package:b2w/views/user/user_profile/professional_info_page.dart';
import 'package:b2w/views/user/user_profile/saved_page.dart';
import 'package:b2w/views/user/user_profile/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widget/app/profile_card.dart';
import 'achievement_page.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  int selectedIndex = 0;  // Default to Post page

  final List<String> chipNames = [
    'Post',
    'Professional Info',
    'Achievements',
    'Saved',
  ];

  // Function that returns the page based on selected index
  Widget _getSelectedPage() {
    switch (selectedIndex) {
      case 0:
        return const PostPage();
      case 1:
        return const ProfessionalInfoPage();
      case 2:
        return const AchievementsPage();
      case 3:
        return const SavedPage();
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Cover Image
                Container(
                  height: 191.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/cover.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Icon Row at top
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: AppColors.white,
                              size: 28.sp,
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              RouteUtils.push(context, SettingsScreen());
                            },
                            child: Icon(
                              Icons.settings,
                              color: AppColors.white,
                              size: 28.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Profile Card
                Positioned(
                  top: 160,
                  left: 18,
                  right: 18,
                  child: ProfileCard(
                    name: 'Alaa Mohamed',
                    title: 'UI/UX Designer',
                    description: 'Passionate UI/UX Designer skilled in creating intuitive and user-friendly digital experiences.',
                    profileImage: 'assets/images/profile image.png',
                    followers: '1k',
                    following: '500',
                    onGitHubTap: () {
                      print('GitHub tapped!');
                    },
                    onFacebookTap: () {
                      print('Facebook tapped!');
                    },
                    onEmailTap: () {
                      print('Email tapped!');
                    },
                    onBehanceTap: () {
                      print('Behance tapped!');
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 210.h),

            // Chip Row for Navigation
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: List.generate(chipNames.length, (index) {
                  bool isSelected = selectedIndex == index;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;  // Update the selected chip index
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Text(
                          chipNames[index],
                          style: TextStyle(
                            color: isSelected ? AppColors.primary : AppColors.darkGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            decoration: isSelected ? TextDecoration.underline : TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),

            // Space between the chips and the selected page
            const SizedBox(height: 20),

            // Display the selected page
            _getSelectedPage(),
          ],
        ),
      ),
    );
  }
}