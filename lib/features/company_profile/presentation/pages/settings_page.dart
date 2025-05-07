
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared_widgets/custom_appbar_widget.dart';
import '../../../../core/utils/sizes.dart';
import '../widgets/settings_widget/settings_optional_title.dart';
import 'accessability_settings.dart';
import 'change_password.dart';
import 'languge.dart';
import 'log_out.dart';
import 'notification_settings.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarContent(title: "Settings", context: context),
      body: Column(
        children: [
          settingsOptionalTitle(
              icon: Icons.language_sharp,
              title: 'language',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LanguageSelectionScreen(),
                    ));
              }),
          spaceHeight(10),
          settingsOptionalTitle(
              icon: Icons.lock, title: 'manage password', onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => ManagePasswordPage(),));}),
          spaceHeight(10),
          settingsOptionalTitle(
              icon: Icons.notifications_none,
              title: 'notification',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationSettingsPage(),));
              }),
          spaceHeight(10),
          settingsOptionalTitle(
              icon: Icons.settings,
              title: 'Accessibility settings',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AccessibilitySettingsPage(),
                    ));
              }),
          spaceHeight(10),
          settingsOptionalTitle(
              icon: Icons.logout, title: 'Log Out', onTap: () {
            showLogoutDialog(context);
          }),
          spaceHeight(10),
        ],
      ),
    );
  }
}
