import 'dart:io';

import 'package:b2w/core/extentions/num.dart';
import 'package:b2w/core/extentions/string.dart';
import 'package:b2w/core/route_Units/route_units.dart';
import 'package:b2w/core/utils/colors.dart';
import 'package:b2w/views/user/home_page/accessability_setting.dart';
import 'package:b2w/views/user/home_page/chatbot_interview_screen.dart';
import 'package:b2w/views/user/home_page/cv_reviewer_screen.dart';
import 'package:b2w/views/user/home_page/notification_screen.dart';
import 'package:b2w/views/user/home_page/search1_screen.dart';
import 'package:b2w/views/user/home_page/sign_langauage_interpreter.dart';
import 'package:b2w/views/user/user_profile/user_profile_screen.dart';
import 'package:b2w/widget/app/app_text.dart';
import 'package:b2w/widget/app/post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../widget/app/feature_container.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  TextEditingController _postController = TextEditingController();
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('logo 2'.assetPNG,
                width: 55.w,
                height: 55.w,),
                Spacer(),
                InkWell(
                  onTap: (){
                    RouteUtils.push(context, UserProfileScreen());
                  },
                    child: Image.asset('Ellipse 13'.assetPNG,width: 36.w,height: 36.h,)),
                SizedBox(
                  width: 4.w,
                ),
                InkWell(
                    onTap: (){
                      RouteUtils.push(context, AccessibilitySettingScreen());
                    },child: Image.asset('accessibility outline'.assetPNG,width: 36.w,height: 36.h,)),
                SizedBox(
                  width: 4.w,
                ),
                InkWell(
                    onTap: (){
                      RouteUtils.push(context, NotificationScreen());
                    },child: Image.asset('Notification1'.assetPNG,width: 36.w,height: 36.h,)),

              ],
            ),
          ),
        ),
        toolbarHeight: 100,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){
                  RouteUtils.push(context, Search1Screen());
                },
                child: Container(
                  width: double.infinity,
                  height: 42.h,
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Icon(Icons.search,
                        size: 32,
                        color: AppColors.darkGrey,),
                        SizedBox(
                          width: 8.w,
                        ),
                        AppText(title: 'Search',color: AppColors.darkGrey,fontSize: 14,fontWeight: FontWeight.w400,)

                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
            Row(
              children: [
                AppText(title: 'Services',color: AppColors.inputText,fontWeight: FontWeight.w400,fontSize: 24,),
                SizedBox(
                  width: 8.w,
                ),

                Expanded(
                  child: Divider(
                    height: 1,
                    color: AppColors.lightGrey,
                    thickness: 1.5,
                  ),
                ),
              ],
            ),SizedBox(
                height: 12.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      RouteUtils.push(context, CvReviewerScreen());
                    },
                    child: FeatureContainer(

                      imagePath: 'assets/images/Layer_1.png',
                      title: 'Resume Reviewer',
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      RouteUtils.push(context, ChatbotInterviewScreen());
                    },
                    child: FeatureContainer(
                      imagePath: 'assets/images/Layer_2.png',
                      title: 'Chatbot Interview',
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      RouteUtils.push(context, SignLangaugeInterpreter());

                    },
                    child: FeatureContainer(
                      imagePath: 'assets/images/Icon Container.png',
                      title: 'Signify',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  AppText(title: 'Posts',color: AppColors.inputText,fontWeight: FontWeight.w400,fontSize: 24,),
                  SizedBox(
                    width: 8.w,
                  ),

                  Expanded(
                    child: Divider(
                      height: 1,
                      color: AppColors.lightGrey,
                      thickness: 1.5,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Column(
                children: [
                  PostCard(profileImage: 'assets/images/post profile img.png', username: 'Sally Ahmed', role:'ui ux', postContent: 'Laboriosam corrupti odit neque aperiam. Explicabo laudantium sit. Dolores rerum numquam deleniti voluptatem ea dolorem. Neque et quibusdam possimus saepe qui amet vel quae facere. Quod cupiditate a aut esse. Quisquam sit voluptas.Omnis dolorem distinctio et velit recusandae officia autem voluptatibus. Ut porro tenetur omnis. Esse quia eaque dolores et non voluptatem exercitationem rerum veritatis. Aspernatur dolorem animi sunt quidem et nisi impedit ut.',
                     likes: 1, comments: 35, views: 500, isFollowing: true),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Column(
                children: [
                  PostCard(profileImage: 'assets/images/post profile img (1).png', username: 'Waleed ali', role:'Product manager', postContent: 'Todays interview',
                   postImagePath:"assets/images/post img 2.png" ,   likes: 3, comments: 21, views: 100, isFollowing: true),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: 320,
                        child: PostCard(profileImage: 'assets/images/person img.png', username: 'Murad Mohammed', role:'Product manager', postImagePath:"assets/images/Frame 192 (1).png" ,
                            postContent: 'Healthcare App Redesign\nVel molestias consequuntur rerum laborum soluta corrupti tenetur. Quas qui ducimus soluta sed ipsam distinctio dicta ea et. Vel cum quasi quod ex cum eaque vel sed. Et illo et praesentium est quo explicabo incidunt.',
                              ),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: 320,
                        child: PostCard(profileImage: 'assets/images/person img (1).png', username: 'Khaled reda', role:'Architectural Engineer',postImagePath:"assets/images/Frame 192.png" ,
                            postContent: 'Modern Residential Building\n Vel molestias consequuntur rerum laborum soluta corrupti tenetur. Quas qui ducimus soluta sed ipsam distinctio dicta ea et. Vel cum quasi quod ex cum eaque vel sed. Et illo et praesentium est quo explicabo incidunt.',
                               ),
                      ),
                    ),
                
                  ],
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Column(
                children: [
                  PostCard(profileImage: 'assets/images/person img 3.png', username: 'Peter Charles', role:'call center', postContent: 'Debitis ab vel illo hic nisi quia suscipit esse. Impedit quis veritatis quod consequatur est saepe. Quo possimus ut. Blanditiis odit nobis commodi aut quibusdam molestiae repudiandae ad recusandae. Voluptate dicta ut necessitatibus est neque rerum dicta.Aliquid quaerat et quia sed. Nisi ut nulla rerum quod blanditiis sequi aperiam. Incidunt laboriosam ipsum ut.Nihil id illum est. Est ut omnis nostrum et. Voluptas fugit ducimus omnis minima perspiciatis quo consectetur. Autem qui necessitatibus quaerat architecto veniam est rerum tenetur.',
                      likes: 1, comments: 1, views: 100, isFollowing: true),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
