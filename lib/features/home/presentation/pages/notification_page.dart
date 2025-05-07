
import 'package:b2w/features/home/presentation/pages/user_profile_page.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final List<Map<String, dynamic>> notifications = [
    {
      "name": "Alaa Mohamed",
      "message": "applied for a Senior UX Designer job.",
      "time": "2 minutes ago",
      "avatar": "assets/images/Ellipse 189(2).png",
      "isNew": true
    },
    {
      "name": "Jane Cooper",
      "message": "applied for a Senior UX Designer job.",
      "time": "10 minutes ago",
      "avatar": "assets/images/Ellipse 189(1).png",
      "isNew": true
    },
    {
      "name": "Cody Fisher",
      "message": "applied for a Senior UX Designer job.",
      "time": "20 minutes ago",
      "avatar": "assets/images/Ellipse 189(2).png",
      "isNew": false
    },
    {
      "name": "Murad Mohamed",
      "message": "Add review",
      "time": "40 minutes ago",
      "avatar": "assets/images/Ellipse 189(3).png",
      "isNew": false
    },
    {
      "name": "Wade Warren",
      "message": "applied for a Joiner UI Designer job.",
      "time": "1 hour ago",
      "avatar": "assets/images/Ellipse 189(2).png",
      "isNew": false
    },
    {
      "name": "Mariem Waleed",
      "message": "applied for a Joiner UI Designer job.",
      "time": "7:00 PM",
      "avatar": "assets/images/Ellipse 189(1).png",
      "isNew": false
    },
    {
      "name": "Jane Cooper",
      "message": "applied for a Joiner UI Designer job.",
      "time": "1:00 PM",
      "avatar": "assets/images/Ellipse 189(3).png",
      "isNew": false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Notifications",
            style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          actions: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "2 New",
                style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(width: 16),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          children: [
            /// عنوان قسم "Today"
            Text(
              "Today",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[800]),
            ),
            SizedBox(height: 8),

             ...notifications.take(5).map((item) {
              return Column(
                children: [
                  NotificationItem(item),
                  Divider(thickness: 1, color: Colors.grey[300]), // الفاصل بين العناصر
                ],
              );
            }).toList(),

            SizedBox(height: 16),

            /// عنوان قسم "Yesterday"
            Text(
              "Yesterday",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[800]),
            ),
            SizedBox(height: 8),

            /// قائمة الإشعارات للأمس مع الفواصل
            ...notifications.skip(5).map((item) {
              return Column(
                children: [
                  NotificationItem(item),
                  Divider(thickness: 1, color: Colors.grey[300]), // الفاصل بين العناصر
                ],
              );
            }).toList(),
          ],
        )

    );
  }
}

class NotificationItem extends StatelessWidget {
  final Map<String, dynamic> data;

  NotificationItem(this.data);

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile(



    ),)),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage(data["avatar"]),
        ),
        title: RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.black, fontSize: 14),
            children: [
              TextSpan(text: data["name"], style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: " ${data["message"]}"),
            ],
          ),
        ),
        subtitle: Text(data["time"], style: TextStyle(color: Colors.grey, fontSize: 12)),
        trailing: data["isNew"]
            ? Icon(Icons.circle, color: Colors.purple, size: 10)
            : null,
      ),
    );
  }
}
