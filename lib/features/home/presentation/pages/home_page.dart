
import 'package:b2w/features/home/presentation/pages/search_page.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared_widgets/custom_buttom.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text_styles.dart';

import '../../../../core/utils/sizes.dart';
import '../../../company_profile/presentation/pages/company_profile.dart';
import '../widgets/home_widgets/home_section.dart';
import 'notification_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> jobListings = [
    {
      "title": "Senior UX Designer",
      "company": "Digital Creative Agency",
      "daysAgo": "5 days ago",
      "applications": 3,
    },
    {
      "title": "Junior UI Designer",
      "company": "Digital Creative Agency",
      "daysAgo": "2 weeks ago",
      "applications": 6,
    },
    {
      "title": "Digital Marketing Specialist",
      "company": "Digital Creative Agency",
      "daysAgo": "2 weeks ago",
      "applications": 7,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/Group 16.png"),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CompanyProfile(),
                              )),
                          child: Image.asset("assets/images/Ellipse 13.png")),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NotificationsPage(),
                                  ));
                            },
                            icon: Icon(
                              Icons.notifications_none_outlined,
                              color: Color(0xff1E1E1E),
                              size: 30,
                            ),
                          ),
                          Positioned(
                            right: 4,
                            top: 4,
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                shape: BoxShape.circle,
                              ),
                              constraints: BoxConstraints(
                                minWidth: 20,
                                minHeight: 20,
                              ),
                              child: Center(
                                child: Text(
                                  '2',
                                  style:StyleManger.white12bold()
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
spaceHeight(20),              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: ColorManger.lightGrey,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    spaceWidth(10),
                    Expanded(
                      child: TextField(
                        readOnly: true,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SearchScreen()), // شاشة البحث
                          );
                        },
                        decoration: InputDecoration(
                          hintText: "Search",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              spaceHeight(20),
              Row(
                children: [
                  Text("Applications", style: StyleManger.darkGrey20w400()),
                  SizedBox(width: 10),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.2,
                    ),
                  ),
                ],
              ),
              spaceHeight(10),
              Expanded(
                child: ListView.separated(
                  itemCount: jobListings.length,
                  itemBuilder: (context, index) {
                    return containerHome(
                        companyName: '${jobListings[index]["company"]}',
                        time: '${jobListings[index]["daysAgo"]}',
                        numberOfApp: '${jobListings[index]["applications"]}',
                        title: '${jobListings[index]["title"]}');
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return spaceHeight(5);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
