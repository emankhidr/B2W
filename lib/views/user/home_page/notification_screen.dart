
import 'package:b2w/core/utils/colors.dart';
import 'package:b2w/widget/notification_card.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class NotificationScreen extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {
      "avatar": "assets/images/img 1.png",
      "message": "Wade Warren Liked your post",
      "timestamp": DateTime.now().subtract(Duration(minutes: 30)),
    },
    {
      "avatar": "assets/images/img 2.png",
      "message": "Jane cooper Liked your photo",
      "timestamp": DateTime.now().subtract(Duration(hours: 3)),
    },


    {
      "avatar": "assets/images/img 4.png",
      "message": "Wade Warren Liked your post",
      "timestamp": DateTime.now().subtract(Duration( hours: 10)),
    },
    {
      "avatar": "assets/images/img 5.png",
      "message": "Wade Warren Liked your post",
      "timestamp": DateTime.now().subtract(Duration( hours: 12)),
    },
    {
      "avatar": "assets/images/img 6.png",
      "message": "Wade Warren Liked your post",
      "timestamp": DateTime.now().subtract(Duration( hours: 18)),
    },
    {
      "avatar": "assets/images/img 3.png",
      "message": "Mariem Waleed Followed you",
      "timestamp": DateTime.now().subtract(Duration(days: 1, hours: 2)),
    },
    {
      "avatar": "assets/images/img 2.png",
      "message": "Jane cooper Liked your photo",
      "timestamp": DateTime.now().subtract(Duration(days: 1, hours: 5)),
    },
    {
      "avatar": "assets/images/img 5.png",
      "message": "Cody fisher Commented on your post",
      "timestamp": DateTime.now().subtract(Duration(days: 1, hours: 10)),
    },
    {
      "avatar": "assets/images/img2.png",
      "message": "Wade Warren Liked your post",
      "timestamp": DateTime.now().subtract(Duration(days: 1, hours: 12)),
    },
    {
      "avatar": "assets/images/img 6.png",
      "message": "Wade Warren Liked your post",
      "timestamp": DateTime.now().subtract(Duration(days: 1, hours: 18)),
    },
  ];

  @override
  Widget build(BuildContext context) {
    Map<String, List<Map<String, dynamic>>> groupedNotifications = groupNotifications(notifications);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(Icons.arrow_back_ios, color: AppColors.black, size: 40,),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Center(
          child: Text(
            "Notifications",
            style: TextStyle(color: AppColors.black,
                fontSize: 25,
                fontWeight: FontWeight.w400,
                fontFamily: 'Lato'),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 12),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "2 New",
              style: TextStyle(color: AppColors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 12),
            ),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 100,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                if (groupedNotifications["Today"]!.isNotEmpty) _buildSection("Today", groupedNotifications["Today"]!),
                if (groupedNotifications["Yesterday"]!.isNotEmpty) _buildSection("Yesterday", groupedNotifications["Yesterday"]!),
              ],
            ),
          ),
          ],
      ),
    );
  }

  Map<String, List<Map<String, dynamic>>> groupNotifications(List<Map<String, dynamic>> notifications) {
    Map<String, List<Map<String, dynamic>>> groupedNotifications = {
      "Today": [],
      "Yesterday": []
    };

    DateTime now = DateTime.now();
    String today = DateFormat('yyyy-MM-dd').format(now);
    String yesterday = DateFormat('yyyy-MM-dd').format(now.subtract(Duration(days: 1)));

    for (var notification in notifications) {
      String date = DateFormat('yyyy-MM-dd').format(notification['timestamp']);

      if (date == today) {
        groupedNotifications["Today"]?.add(notification);
      } else if (date == yesterday) {
        groupedNotifications["Yesterday"]?.add(notification);
      }
    }

    return groupedNotifications;
  }

  Widget _buildSection(String title, List<Map<String, dynamic>> notifications) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color:AppColors.black),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return NotificationCard(notification: notifications[index]);
          },
        ),

      ],
    );
  }
}
