import 'package:b2w/core/utils/colors.dart';
import 'package:flutter/material.dart';

class BottomMenu extends StatelessWidget {
  final VoidCallback onEmojiTap;

  BottomMenu({required this.onEmojiTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.lightPrimary,
            child: Icon(Icons.add, color: AppColors.primary),
          ),
          SizedBox(width: 10),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person_add, color: AppColors.primary),
          ),
          IconButton(
            onPressed: onEmojiTap,
            icon: Icon(Icons.emoji_emotions, color: AppColors.primary),
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              print("Post shared");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text("Share",style: TextStyle(
              color: AppColors.white,
            ),),
          ),
        ],
      ),
    );
  }
}
