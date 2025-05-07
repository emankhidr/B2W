import 'package:b2w/core/route_Units/route_units.dart';
import 'package:b2w/core/utils/colors.dart';
import 'package:b2w/views/user/user_profile/followers_screen.dart';
import 'package:b2w/views/user/user_profile/following_screen.dart';
import 'package:b2w/views/user/user_profile/personal_info_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class ProfileCard extends StatelessWidget {
  final String name;
  final String title;
  final String description;
  final String profileImage;
  final String followers;
  final String following;
  final VoidCallback? onGitHubTap;
  final VoidCallback? onFacebookTap;
  final VoidCallback? onEmailTap;
  final VoidCallback? onBehanceTap;

  const ProfileCard({
    Key? key,
    required this.name,
    required this.title,
    required this.description,
    required this.profileImage,
    required this.followers,
    required this.following,
    this.onGitHubTap,
    this.onFacebookTap,
    this.onEmailTap,
    this.onBehanceTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(profileImage),
                  ),
                ),
                SizedBox(width: 24.w),
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: InkWell(
                    onTap: (){
                      RouteUtils.push(context, PersonalInfoEdit());
                    },
                    child: Icon(
                      Icons.edit,
                      size: 18,
                      color: AppColors.grey,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18,
              color: AppColors.black,
              fontFamily: 'Lato'),
            ),
            Text(
              title,
              style: TextStyle(color:AppColors.darkGrey
              ,fontSize: 10,
              fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 10),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10, color: AppColors.darkGrey,
              fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: (){
                      RouteUtils.push(context, FollowersScreen());
                    },

                    child: Icon(Icons.group_sharp, color: AppColors.darkGrey,size: 36,)),
                SizedBox(
                  width: 8.w,
                ),
                Column(
                  children: [
                    Text(followers, style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18
                    ),),
                    Text("Followers",  style: TextStyle(color:AppColors.darkGrey
                      ,fontSize: 10,
                      fontWeight: FontWeight.w400,),
                    ),
                  ],
                ),
                SizedBox(width: 40),
                InkWell(
                  onTap: (){
                    RouteUtils.push(context,FollowingScreen());
                  },
                    child: Icon(Icons.group_sharp, color: AppColors.darkGrey,size: 36,)),
                SizedBox(
                  width: 8.w,
                ),
              Column(
                children: [
                  Text(following, style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18
                  ),),
                  Text("Following",  style: TextStyle(color:AppColors.darkGrey
                    ,fontSize: 10,
                    fontWeight: FontWeight.w400,),
                  ),
                ],
              )
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(icon: FaIcon(FontAwesomeIcons.github),onPressed: onGitHubTap,color: AppColors.primary,),
                IconButton(icon: Icon(Icons.facebook, size: 18,), onPressed: onFacebookTap,color: AppColors.primary),
                IconButton(icon: Icon(Icons.email,size: 18,), onPressed: onEmailTap,color: AppColors.primary),
                IconButton(icon: FaIcon(FontAwesomeIcons.behance), onPressed: onBehanceTap,color: AppColors.primary),
              ],
            ),
          ],
        ),
      ),
    );
  }
}