import 'package:flutter_bloc/flutter_bloc.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit()
      : super(AllChatLoaded(chatList: [
    {
      "name": "Alaa Mohamed",
      "message": "We are thrilled to inform you ...",
      "time": "5:00 PM",
      "image": "assets/images/chat.png"
    },
    {
      "name": "Sally Ahmed",
      "message": "Hey, did you check out...",
      "time": "1:00 PM",
      "image": "assets/images/chat img.png"
    },
  ], filteredChats: [], messages: {})) {
    emit((state as AllChatLoaded).copyWith(
      filteredChats: List<Map<String, String>>.from(
          (state as AllChatLoaded).chatList),
      messages: {},
    ));
  }

   void addChat(String name, String image) {
    if (state is! AllChatLoaded) return;

    final currentState = state as AllChatLoaded;
    final newChat = {
      "name": name,
      "message": "New chat started...",
      "time": "Now",
      "image": image,
    };

    final updatedChatList = List<Map<String, String>>.from(currentState.chatList)
      ..add(newChat);

    final updatedMessages = Map<String, List<String>>.from(currentState.messages)
      ..putIfAbsent(name, () => []);

    emit(currentState.copyWith(
      chatList: updatedChatList,
      filteredChats: updatedChatList,
      messages: updatedMessages,
    ));
  }

   void filterChats(String query) {
    if (state is! AllChatLoaded) return;

    final currentState = state as AllChatLoaded;
    final filtered = query.isEmpty
        ? currentState.chatList
        : currentState.chatList
        .where((chat) => chat["name"]!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    emit(currentState.copyWith(filteredChats: filtered));
  }

   void sendMessage(String chatName, String message) {
    if (state is! AllChatLoaded || message.trim().isEmpty) return;

    final currentState = state as AllChatLoaded;
    final updatedMessages = Map<String, List<String>>.from(currentState.messages);

     updatedMessages.putIfAbsent(chatName, () => []);
    updatedMessages[chatName]!.add(message);

    emit(currentState.copyWith(messages: updatedMessages));
  }

   void clearMessages(String chatName) {
    if (state is! AllChatLoaded) return;

    final currentState = state as AllChatLoaded;
    final updatedMessages = Map<String, List<String>>.from(currentState.messages);
    updatedMessages[chatName] = [];

    emit(currentState.copyWith(messages: updatedMessages));
  }
}
