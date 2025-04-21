import 'package:b2w/core/utils/colors.dart';
import 'package:b2w/widget/app/buttom_menu.dart';
import 'package:b2w/widget/app/emoji_menu.dart';
import 'package:flutter/material.dart';

class SharePostScreen extends StatefulWidget {
  const SharePostScreen({super.key});

  @override
  State<SharePostScreen> createState() => _SharePostScreenState();
}

class _SharePostScreenState extends State<SharePostScreen> {
  bool _isEmojiMenuVisible = false;
  final TextEditingController _postController = TextEditingController();
  FocusNode _focusNode = FocusNode();

  void _toggleEmojiMenu() {
    setState(() {
      _isEmojiMenuVisible = !_isEmojiMenuVisible;
    });
    if (_isEmojiMenuVisible) {
      _focusNode.unfocus(); // Hide keyboard when showing emoji menu
    }
  }
  @override
  Widget build(BuildContext context) {
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
            "Share Post",
            style: TextStyle(color: AppColors.black,
                fontSize: 25,
                fontWeight: FontWeight.w400,
                fontFamily: 'Lato'),
          ),
        ),
        elevation: 0,
        toolbarHeight: 100,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                controller: _postController,
                focusNode: _focusNode,
                style: TextStyle(color: AppColors.black),
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
                onTap: () {
                  setState(() {
                    _isEmojiMenuVisible = false;
                  });
                },
              ),
            ),
          ),
          if (_isEmojiMenuVisible) EmojiMenu(),
          BottomMenu(onEmojiTap: _toggleEmojiMenu),
        ],
      ),
    );
  }
}
