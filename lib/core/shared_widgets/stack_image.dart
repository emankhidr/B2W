import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customStackImage({
  required VoidCallback onBackPressed,
  required VoidCallback onPressedSettings,
  required String backgroundImage,
  required String profileImage,
  required String name,
  required String jobTitle,
  required String bio,
  required String followers,
  required String posts,
 required bool showPosts  , // جديد: تحكم في إظهار عدد المنشورات
  List<Widget>? extraWidgets,
}) {
  return Stack(
    alignment: Alignment.topCenter,
    clipBehavior: Clip.none,
    children: [
       Container(
        height: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
      ),

       Positioned(
        top: 30,
        left: 10,
        right: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: onBackPressed,
              icon: Icon(Icons.arrow_back_ios_new_sharp, color: Colors.white),
            ),
            IconButton(
              onPressed: onPressedSettings,
              icon: Icon(Icons.settings, color: Colors.white),
            ),
          ],
        ),
      ),

       Positioned(
        top: 130,
        child: Container(
          width: 320,
          padding: EdgeInsets.only(top: 50, bottom: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.purple.withOpacity(0.1),
                offset: Offset(0, 8),
                blurRadius: 10,
              ),
            ],
          ),
          child: Column(
            children: [
               Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text(jobTitle, style: TextStyle(color: Colors.black54)),

              SizedBox(height: 20),

               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  bio,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),

              SizedBox(height: 10),

               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.people, color: Colors.purple, size: 36),
                  SizedBox(width: 3),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("$followers", style: TextStyle(color: Colors.black54)),
                      Text("Followers", style: TextStyle(color: Colors.black54)),
                    ],
                  ),
                  if (showPosts) ...[
                    SizedBox(width: 53),
                    Icon(Icons.article, color: Colors.purple, size: 36),
                    SizedBox(width: 3),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(posts, style: TextStyle(color: Colors.black54)),
                        Text("Posts", style: TextStyle(color: Colors.black54)),
                      ],
                    ),
                  ]
                ],
              ),

              SizedBox(height: 10),

              // أيقونات التواصل الاجتماعي
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.facebook, color: Colors.purple, size: 20),
                  SizedBox(width: 10),
                  Icon(Icons.email, color: Colors.purple, size: 20),
                  SizedBox(width: 10),
                  Icon(Icons.beenhere, color: Colors.purple, size: 20),
                  SizedBox(width: 10),
                  Icon(Icons.link, color: Colors.purple, size: 20),
                ],
              ),

              SizedBox(height: 10),

              // ودجت إضافية عند الحاجة
              if (extraWidgets != null)
                Padding(
                  padding: EdgeInsets.only(top: 10,left: 20),
                  child: Column(children: extraWidgets),
                ),
            ],
          ),
        ),
      ),

      // صورة البروفايل
      Positioned(
        top: 90,
        child: CircleAvatar(
          radius: 40,
          backgroundColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(4),
            child: ClipOval(
              child: Image.asset(
                profileImage,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
