import 'dart:io';
import 'package:b2w/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostCard extends StatefulWidget {
  final String profileImage;
  final String username;
  final String role;
  final String postContent;
  final String? postImagePath;
  final int? likes;
  final int ?comments;
  final int? views;
  final bool ?isFollowing;

  const PostCard({
    super.key,
    required this.profileImage,
    required this.username,
    required this.role,
    required this.postContent,
    this.postImagePath,
     this.likes,
    this.comments,
    this.views,
    this.isFollowing,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLiked = false;
  bool isFollowing = false;
  int likeCount = 0;
  void initState() {
    super.initState();
    likeCount = widget.likes??0;
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likeCount += isLiked ? 1 : -1;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Section
          Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage(widget.profileImage),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.username,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        fontFamily: 'Lato',
                        color: AppColors.black,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      widget.role,
                      style: TextStyle(color: AppColors.darkGrey, fontSize: 12,fontWeight: FontWeight.w300),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Spacer(),

              if (widget.isFollowing != null && widget.isFollowing == true)
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                'Following',
                  style: const TextStyle(
                    color:AppColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Icon(Icons.more_vert, color: AppColors.black),
            ],
          ),
          const SizedBox(height: 8),

          Text(
            widget.postContent,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12, color: AppColors.black),
          ),
          const SizedBox(height: 12),
          if (widget.postImagePath != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                widget.postImagePath!,
                height: 150,
                width: double.infinity,
                fit: BoxFit.fill, // Ensures proper scaling
              ),
            ),
          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (widget.likes != null)
              GestureDetector(
                onTap: toggleLike,
                child: Expanded(
                  child: Row(
                    children: [
                      Icon(
                        isLiked ? Icons.thumb_up : Icons.thumb_up_off_alt,
                        color: isLiked ? AppColors.primary : AppColors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text('${widget.likes} Like', style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.grey)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              if (widget.comments != null)
              Expanded(
                child: Row(
                  children: [
                    const Icon(Icons.comment_outlined, color:AppColors.grey),
                    const SizedBox(width: 4),
                    Text('${widget.comments} Comment', style: const TextStyle(fontSize: 12)
                    , overflow: TextOverflow.ellipsis,),

                  ],
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              if (widget.views != null)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.remove_red_eye_outlined, color: AppColors.grey),
                  const SizedBox(width: 4),
                  Text('${widget.views} Views', style: const TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}