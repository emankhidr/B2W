import 'package:b2w/core/extentions/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';
import '../../../core/utils/colors.dart';

// MessageModel class definition
class MessageModel {
  final bool isUser;
  final String message;
  final DateTime time;

  MessageModel({
    required this.isUser,
    required this.message,
    required this.time,
  });
}

class ChatbotItself extends StatefulWidget {
  const ChatbotItself({super.key});

  @override
  State<ChatbotItself> createState() => _ChatbotItselfState();
}

class _ChatbotItselfState extends State<ChatbotItself> {
  static const apiKey = 'AIzaSyBfpVce_FkYcMigTUVx97BfDSSOJwYAzzM';
  final model = GenerativeModel(model: 'gemini-pro-vision', apiKey: apiKey);

  final List<MessageModel> chat = [];
  TextEditingController messageController = TextEditingController();

  Future<void> sendMessage() async {
    final message = messageController.text.trim();
    if (message.isEmpty) return;

    setState(() {
      messageController.clear();
      chat.add(MessageModel(isUser: true, message: message, time: DateTime.now()));
    });

    final response = await model.generateContent([Content.text(message)]);
    final botReply = response.text ?? "I didn't understand, please try again.";

    setState(() {
      chat.add(MessageModel(isUser: false, message: botReply, time: DateTime.now()));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(Icons.arrow_back_ios, color: AppColors.black, size: 40),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  child: Image.asset('Mask group'.assetPNG),
                ),
                Positioned(
                  bottom: 12,
                  right: 12,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: ClipOval(
                      child: Image.asset('robot'.assetPNG),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 4.w),
            Text(
              "Interview Chat",
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Lato'),
            ),
          ],
        ),
        elevation: 0,
        toolbarHeight: 100,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chat.length,
              itemBuilder: (context, index) {
                final message = chat[index];
                return userPrompt(
                  isUser: message.isUser,
                  message: message.message,
                  date: DateFormat('hh:mm a').format(message.time),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  flex: 20,
                  child: TextField(
                    controller: messageController,
                    style: TextStyle(
                        color: AppColors.inputText,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        hintText: 'Type here...'),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: sendMessage,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColors.primary,
                    child: Icon(
                      Icons.send,
                      color: AppColors.white,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container userPrompt({
    required bool isUser,
    required String message,
    required String date,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(vertical: 15)
          .copyWith(left: isUser ? 15 : 80, right: isUser ? 80 : 15),
      decoration: BoxDecoration(
        color: isUser ? AppColors.white : AppColors.grey,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.inputText,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: TextStyle(
                color: AppColors.inputText,
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                date,
                style: TextStyle(
                    color: AppColors.inputText,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ],
          )
        ],
      ),
    );
  }
}
