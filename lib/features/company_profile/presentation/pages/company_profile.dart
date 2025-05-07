
import 'package:b2w/features/company_profile/presentation/pages/settings_page.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared_widgets/stack_image.dart';
 import '../../../../core/utils/sizes.dart';
import '../../../home/presentation/pages/add_people.dart';
import '../widgets/home_tabs_widget/open_job_tab.dart';
import '../widgets/home_tabs_widget/people_tab.dart';
import '../widgets/home_tabs_widget/review_tab.dart';
import '../widgets/home_tabs_widget/tab_about_widget.dart';

class CompanyProfile extends StatefulWidget {

  const CompanyProfile({super.key});

  @override
  State<CompanyProfile> createState() => _CompanyProfileState();
}

class _CompanyProfileState extends State<CompanyProfile> {
  List<Map<String, String>> people = [
    {
      "name": "Liam Carter",
      "role": "CEO",
      "image": "https://i.pravatar.cc/150?img=1"
    },
    {
      "name": "Murad Mohamed",
      "role": "Product manager",
      "image": "https://i.pravatar.cc/150?img=3"
    },
    {
      "name": "Salma Ahmed",
      "role": "Product Designer",
      "image": "https://i.pravatar.cc/150?img=5"
    },
    {
      "name": "Ali Wael",
      "role": "Graphic Designer",
      "image": "https://i.pravatar.cc/150?img=7"
    },
    {
      "name": "Waleed Ali",
      "role": "HR",
      "image": "https://i.pravatar.cc/150?img=9"
    },
    {
      "name": "Sophia Bennett",
      "role": "Motion designer",
      "image": "https://i.pravatar.cc/150?img=10"
    },
    {
      "name": "Mia Collins",
      "role": "Product manager",
      "image": "https://i.pravatar.cc/150?img=15"
    },
    {
      "name": "Ethan Rivera",
      "role": "Product manager",
      "image": "https://i.pravatar.cc/150?img=20"
    },
  ];
  List<Map<String, String>> reviews = [
    {
      "name": "Murad Mohamed",
      "title": "Product Manager",
      "job": "Managing product development and strategy",
      "image": "assets/images/Ellipse 189(4).png"
    },
    {
      "name": "Aisha Patel",
      "title": "UX Designer",
      "job": "Creating user-friendly designs and experiences",
      "image": "assets/images/Ellipse 189(2).png"
    },
    {
      "name": "Reham Ahmed",
      "title": "UI Developer",
      "job": "Developing interactive UI components",
      "image": "assets/images/Ellipse 189(3).png"
    },
    {
      "name": "Juan Rodriguez",
      "title": "Content Strategist",
      "job": "Planning and optimizing digital content",
      "image": "assets/images/Ellipse 189(1).png"
    },
    {
      "name": "Yasmin Essam",
      "title": "Marketing Specialist",
      "job": "Developing marketing campaigns and strategies",
      "image": "assets/images/Ellipse 189.png"
    },
  ];

  void _removePerson(int index) {
    setState(() {
      people.removeAt(index);
    });
  }

  void _addPerson() {
    setState(() {
      people.add({
        "name": "New Person",
        "role": "New Role",
        "image": "https://i.pravatar.cc/150?img=${people.length + 1}"
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4, // عدد التبويبات
        child: Scaffold(
          backgroundColor: Colors.white,
            body: Column(children: [
          customStackImage(
              backgroundImage:
                  'assets/images/WhatsApp Image 2025-03-04 at 5.47.31 AM(1).jpeg',
              profileImage: 'assets/images/Ellipse 13.png',
              name: 'Alaa Mohamed',
              jobTitle: 'Digital Creative Agency',
              bio:
                  'Empowering brands with creative digital solutions and strategies. Let’s innovate together!',
              followers: '100',
              posts: '',
              extraWidgets: [
                Center(
                  child: Row(
                    children: [
                      Icon(Icons.link),
                      spaceWidth(3),
                      Text("http://Digital Creative Agency.name")
                    ],
                  ),
                )
              ],
              showPosts: false, onBackPressed: () { Navigator.pop(context); }, onPressedSettings: () { Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage(),)); }),
          SizedBox(height: 260),
          TabBar(
            indicatorColor: Colors.purple,
            labelColor: Colors.purple,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            tabs: [
              Tab(text: "Posts"),
              Tab(text: "Open jobs"),
              Tab(text: "Reviews"),
              Tab(text: "people"),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                aboutTab(),
                openJobTab(),
                reviewsTab(),
                peopleTab(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddPeopleScreen(),)) ; })
              ],
            ),
          ),
        ])));
  }


}
