import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget postTabWidget(){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: ListView(
      children: [
        Container(
          height: 280,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        'assets/images/Ellipse 189(1).png'),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Alaa Mohamed",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "UIUX designer",
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.more_vert, color: Colors.black54),
                ],
              ),
              SizedBox(height: 30),

               Text(
                "Laboriosam corrupti odit neque aperiam. Explicabo laudantium sit. Dolores rerum numquam deleniti voluptatem ea dolorem.",
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
              SizedBox(height: 60),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        color: Colors.grey,
                        onPressed: () {},
                        icon: Icon(Icons.thumb_up_alt_outlined),
                      ),
                      SizedBox(width: 5),
                      Text("Like", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        color: Colors.grey,
                        onPressed: () {},
                        icon: Icon(Icons.chat_bubble_outline),
                      ),
                      SizedBox(width: 5),
                      Text("Comment", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        color: Colors.grey,
                        onPressed: () {},
                        icon: Icon(
                          Icons.remove_red_eye_outlined,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text("Views", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage:
                    AssetImage('assets/images/post img 2.png'), // صورة المستخدم
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Alaa Mohamed",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "UIUX designer",
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.more_vert, color: Colors.black54),
                ],
              ),

              SizedBox(height: 10),

               Text("Luv it?", style: TextStyle(fontSize: 14)),

              SizedBox(height: 10),

               ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/images/post img 2.png", // استبدل بالصورة المطلوبة
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(height: 10),

               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(  color: Colors.grey, onPressed: () {  }, icon: Icon(Icons.thumb_up_alt_outlined,),),
                      SizedBox(width: 5),
                      Text("Like", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(  color: Colors.grey, onPressed: () {  }, icon: Icon(Icons.chat_bubble_outline_outlined,),),
                      SizedBox(width: 5),
                      Text("Comment", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(  color: Colors.grey, onPressed: () {  }, icon: Icon(Icons.visibility,),),
                      SizedBox(width: 5),
                      Text("Views", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}