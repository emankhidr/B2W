
import 'package:flutter/material.dart';

   import '../../../company_profile/presentation/pages/settings_page.dart';
import '../widgets/user_profile_widgets/achievement_tab.dart';
import '../widgets/user_profile_widgets/post_tab.dart';
import '../widgets/user_profile_widgets/profissional_info_tab.dart';
import '../../../../core/shared_widgets/stack_image.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            customStackImage(

                backgroundImage:
                    'assets/images/WhatsApp Image 2025-03-04 at 5.47.31 AM.jpeg',
                profileImage: 'assets/images/Ellipse 189(4).png',
                name: 'Alaa Mohamed',
                jobTitle: 'UI/UX Designer',
                bio:
                    "Passionate UI/UX Designer skilled in creating intuitive and user-friendly digital experiences.",
                followers: '100k',
                posts: '500', showPosts: true, onBackPressed: () { Navigator.pop(context) ;}, onPressedSettings: () { Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage(),)); }),

            SizedBox(height: 260),

             TabBar(
              indicatorColor: Colors.purple,
              labelColor: Colors.purple,
              unselectedLabelColor: Colors.grey,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              tabs: [
                Tab(text: "Posts"),
                Tab(text: "Professional Info"),
                Tab(text: "Achievements"),
              ],
            ),

            /// **TabBarView داخل Expanded حتى يأخذ المساحة المتبقية**
            Expanded(
              child: TabBarView(
                children: [
                  postTabWidget(),
                  profissionalInfoWidget(),
                  achievementWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




