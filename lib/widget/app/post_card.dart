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
  final int? comments;
  final int? views;
  final bool? isFollowing;

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
  bool showOptions = false;
  bool showComments = false;

  void initState() {
    super.initState();
    likeCount = widget.likes ?? 0;
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likeCount += isLiked ? 1 : -1;
    });
  }

  void toggleOptions() {
    setState(() {
      showOptions = !showOptions;
    });
  }

  void toggleComments() {
    setState(() {
      showComments = !showComments;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
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
                        Text(widget.username),
                        Text(widget.role),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: toggleOptions,
                    child: const Icon(Icons.more_vert, color: AppColors.black),
                  ),
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
                              isLiked
                                  ? Icons.thumb_up
                                  : Icons.thumb_up_off_alt,
                              color: isLiked
                                  ? AppColors.primary
                                  : AppColors.grey,
                            ),
                            const SizedBox(width: 4),
                            Text('${widget.likes} Like',
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.grey)),
                          ],
                        ),
                      ),
                    ),
                  SizedBox(
                    width: 30.w,
                  ),
                  if (widget.comments != null)
                    GestureDetector(
                      onTap: toggleComments, // Toggle comments visibility
                      child: Expanded(
                        child: Row(
                          children: [
                            const Icon(Icons.comment_outlined,
                                color: AppColors.grey),
                            const SizedBox(width: 4),
                            Text(
                              '${widget.comments} Comment',
                              style: const TextStyle(fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  SizedBox(
                    width: 8.w,
                  ),
                  if (widget.views != null)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.remove_red_eye_outlined,
                            color: AppColors.grey),
                        const SizedBox(width: 4),
                        Text(
                          '${widget.views} Views',
                          style: const TextStyle(fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                ],
              ),
              // Comments section
              if (showComments)
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
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
                      // Comment User Info
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(widget.profileImage),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.username,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(widget.role),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Comment Text
                      Text(
                        'This is a sample comment!',
                        style: TextStyle(fontSize: 14, color: AppColors.black),
                      ),
                      const SizedBox(height: 10),
                      // Like & Reply Option
                      Row(
                        children: [
                          Icon(
                            Icons.favorite_border,
                            color: AppColors.grey,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text('Like', style: TextStyle(fontSize: 12)),
                          const SizedBox(width: 16),
                          GestureDetector(
                            onTap: () {},
                            child: Text('Reply', style: TextStyle(fontSize: 12)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        // Edit and Delete Options
        if (showOptions)
          Positioned(
            right: 0,
            top: -5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text('Edit', style: TextStyle(color: Colors.blue)),
                  ),
                  const SizedBox(height: 4),
                  GestureDetector(
                    onTap: () {},
                    child: Text('Delete', style: TextStyle(color: Colors.red)),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
