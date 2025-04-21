import 'package:b2w/core/utils/colors.dart';
import 'package:flutter/material.dart';

class EmojiMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("🎨", style: TextStyle(fontSize: 24)),
          Text("💡", style: TextStyle(fontSize: 24)),
          Text("🚀", style: TextStyle(fontSize: 24)),
          Text("👷‍♂️", style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}
