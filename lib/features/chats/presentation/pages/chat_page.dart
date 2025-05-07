import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text_styles.dart';
import '../bloc/chat_cubit.dart';
import '../bloc/chat_state.dart';

class ChatPage extends StatelessWidget {
  final String name;
  final String image;

  ChatPage({required this.name, required this.image});

  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<ChatCubit>(),
      child: Scaffold(

          appBar: AppBar(
            leading: SizedBox(
              width: 20,
              height: 35,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    size: 30,
                    color: ColorManger.black,
                  )), // أيقونة السهم كمثال
            ),
            title: Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage(image)),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: StyleManger.black16w400(),
                    ),
                    Text(
                      'Offline',
                      style: StyleManger.graniteGray10w500(),
                    ),
                  ],
                ),
              ],
            ),
            backgroundColor: Color(0xffF3E8FF),
            elevation: 0,
          ),
          body: Container(
            height: 724,
            decoration: BoxDecoration(
                color: ColorManger.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(48),
                    topRight: Radius.circular(48))),
            child: Column(
              children: [
                Expanded(
                  child: BlocBuilder<ChatCubit, ChatState>(
                    builder: (context, state) {
                      if (state is AllChatLoaded) {
                        final messages = state.messages[name] ?? [];

                        return ListView.builder(
                          padding: EdgeInsets.all(16),
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            return Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                padding: EdgeInsets.all(12),
                                margin: EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                  color: ColorManger.primary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  messages[index],
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            );
                          },
                        );
                      }
                      return Center(child: Text("No messages yet"));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _messageController,
                          decoration: InputDecoration(
                            hintText: 'Type here...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          final message = _messageController.text.trim();
                          if (message.isNotEmpty) {
                            context
                                .read<ChatCubit>()
                                .sendMessage(name, message);
                            _messageController.clear();
                          }
                        },
                        child: CircleAvatar(
                          backgroundColor:ColorManger.primary,
                          child: Icon(Icons.send, color: ColorManger.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
