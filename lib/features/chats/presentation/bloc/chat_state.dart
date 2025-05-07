import 'package:flutter/cupertino.dart';

@immutable
abstract class ChatState {}

class AllChatLoaded extends ChatState {
  final List<Map<String, String>> chatList;
  final List<Map<String, String>> filteredChats;
  final Map<String, List<String>> messages;

  AllChatLoaded({
    required this.chatList,
    required this.filteredChats,
    required this.messages,
  });

  AllChatLoaded copyWith({
    List<Map<String, String>>? chatList,
    List<Map<String, String>>? filteredChats,
    Map<String, List<String>>? messages,
  }) {
    return AllChatLoaded(
      chatList: chatList ?? this.chatList,
      filteredChats: filteredChats ?? this.filteredChats,
      messages: messages ?? this.messages,
    );
  }
}
