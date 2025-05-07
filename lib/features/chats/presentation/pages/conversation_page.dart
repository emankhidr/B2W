import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared_widgets/custom_appbar_widget.dart';
import '../../../../core/styles/colors.dart';


import '../../../../core/utils/sizes.dart';
import '../bloc/chat_cubit.dart';
import '../bloc/chat_state.dart';
import '../widgets/chat_item_widget.dart';
import 'contact_page.dart';



class ConversationPage extends StatefulWidget {
  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarContent(title: 'Chats', context: context),
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.all(12.0),
              child:  Container(
                height: 42,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.grey),
                       spaceWidth(8),
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        onChanged: (query) => context.read<ChatCubit>().filterChats(query),
                        decoration: const InputDecoration(
                          hintText: "Search chats...",
                          border: InputBorder.none,
                          isCollapsed: true,
                        ),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    if (searchController.text.isNotEmpty)
                      IconButton(
                        icon: const Icon(Icons.clear, color: Colors.grey),
                        onPressed: () {
                          searchController.clear();
                          context.read<ChatCubit>().filterChats("");
                          setState(() {});
                        },
                      ),
                  ],
                ),
              )


          ),
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                if (state is AllChatLoaded) {
                  return ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    itemCount: state.filteredChats.length,
                    separatorBuilder: (context, index) => Divider(),
                    itemBuilder: (context, index) {
                      final chat = state.filteredChats[index];
                      return chatItem(
                        context,
                        name: chat["name"]!,
                        message: chat["message"]!,
                        time: chat["time"]!,
                        image: chat["image"]!,
                      );
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newChat = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContactsPage()),
          );

          if (newChat != null) {
            context
                .read<ChatCubit>()
                .addChat(newChat["name"], newChat["image"]);
          }
        },
        backgroundColor: ColorManger.primary,
        child: Icon(Icons.add, color: ColorManger.white),
      ),

    );
  }


}
