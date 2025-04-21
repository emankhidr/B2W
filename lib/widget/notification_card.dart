import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationCard extends StatelessWidget {
  final Map<String, dynamic> notification;

  const NotificationCard({Key? key, required this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(notification['avatar']),
      ),
      title: Text(notification['message']),
      subtitle: Text(DateFormat('h:mm a').format(notification['timestamp'])),
    );
  }
}