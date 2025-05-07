import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/appbar_content.dart';
import 'bloc/chat_cubit.dart';
import 'bloc/chat_state.dart';
import 'chat_page.dart';
import 'contact_page.dart';

class HomeChatScreen extends StatefulWidget {
  @override
  _HomeChatScreenState createState() => _HomeChatScreenState();
}

class _HomeChatScreenState extends State<HomeChatScreen> {
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
      appBar: appBarContent(title: 'Chat', context: context),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12.0),
            child:Container(
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
                  const SizedBox(width: 8), // مسافة صغيرة بين الأيقونة والتكست
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      onChanged: (query) => context.read<ChatCubit>().filterChats(query),
                      decoration: const InputDecoration(
                        hintText: "Search chats...",
                        border: InputBorder.none,
                        isCollapsed: true, // 🔥 يجعل النص متماشياً مع الأيقونات
                      ),
                      style: const TextStyle(fontSize: 16), // ضبط حجم النص ليتماشى مع الأيقونات
                    ),
                  ),
                  if (searchController.text.isNotEmpty)
                    IconButton(
                      icon: const Icon(Icons.clear, color: Colors.grey),
                      onPressed: () {
                        searchController.clear();
                        context.read<ChatCubit>().filterChats("");
                        setState(() {}); // ✅ تحديث الـ UI بعد المسح
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
            MaterialPageRoute(builder: (context) => ContactsScreen()),
          );

          if (newChat != null) {
            context
                .read<ChatCubit>()
                .addChat(newChat["name"], newChat["image"]);
          }
        },
        backgroundColor: Colors.purple,
        child: Icon(Icons.add, color: Colors.white),
      ),
     
    );
  }

  Widget chatItem(BuildContext context,
      {required String name,
        required String message,
        required String time,
        required String image}) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: AssetImage(image)),
      title: Text(name,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      subtitle: Text(message, overflow: TextOverflow.ellipsis),
      trailing: Text(time, style: TextStyle(color: Colors.grey)),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(name: name, image: image),
          ),
        );
      },
    );
  }
}
