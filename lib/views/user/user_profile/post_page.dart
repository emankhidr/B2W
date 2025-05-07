import 'package:b2w/widget/app/post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              PostCard(profileImage: 'assets/images/profile image.png', username: 'Alaa Mohamed', role:'ui-ux', postContent: 'Laboriosam corrupti odit neque aperiam. Explicabo laudantium sit. Dolores rerum numquam deleniti voluptatem ea dolorem. Neque et quibusdam possimus saepe qui amet vel quae facere. Quod cupiditate a aut esse. Quisquam sit voluptas.Omnis dolorem distinctio et velit recusandae officia autem voluptatibus. Ut porro tenetur omnis. Esse quia eaque dolores et non voluptatem exercitationem rerum veritatis. Aspernatur dolorem animi sunt quidem et nisi impedit ut.',
                  likes: 1, comments: 35, views: 500, isFollowing: true),
              SizedBox(
                height: 8.h,
              ),
              PostCard(profileImage: 'assets/images/profile image.png', username: 'Alaa Mohamed', role:'ui-ux', postContent: 'Luv it?',
                  postImagePath:"assets/images/colored.png" ,   likes: 3, comments: 21, views: 100, isFollowing: true),
            ],
          ),
        ),
    );
  }
}
