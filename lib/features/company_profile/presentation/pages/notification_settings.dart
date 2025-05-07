 import 'package:flutter/material.dart';

import '../../../../core/shared_widgets/custom_appbar_widget.dart';

class NotificationSettingsPage extends StatefulWidget {
  @override
  _NotificationSettingsPageState createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState
    extends State<NotificationSettingsPage> {
  String? _notificationChoice;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarContent(title: "Notification Settings", context: context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Color(0xffF2E5FF),
                      shape: BoxShape.circle,
                    ),
                  ),

                  Container(
                    child: Center(
                        child: Icon(
                          Icons.notifications_none_rounded,
                          color: Color(0xff7F00FF),
                          size: 100,
                        )),
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color(0xffE5CCFF),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Text(
              "Do you want to allow notifications to receive all updates?",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildRadioOption("Allow"),
                SizedBox(width: 20),
                buildRadioOption("Don't Allow"),
              ],
            ),
            Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _notificationChoice != null ? () {} : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _notificationChoice != null
                      ? Colors.purple
                      : Colors.grey[300],
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text("Save", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRadioOption(String title) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<String>(
          value: title,
          groupValue: _notificationChoice,
          activeColor: Colors.purple,
          onChanged: (value) {
            setState(() {
              _notificationChoice = value;
            });
          },
        ),
        Text(title, style: TextStyle(fontSize: 16)),
      ],
    );
  }
}
