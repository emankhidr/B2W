 import 'package:flutter/material.dart';

import '../../../../core/shared_widgets/custom_appbar_widget.dart';

class LanguageSelectionScreen extends StatefulWidget {
  @override
  _LanguageSelectionScreenState createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String _selectedLanguage = 'English';

  final List<String> languages = [
    'English',
    'Arabic',
    'Spanish',
    'Mandarin',
    'French',
    'Russian',
    'Hindi',
    'Portuguese',
    'German',
    'Italian',
    'Japanese',
    'Korean',
    'Dutch',
    'Swedish',
    'Vietnamese'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarContent(title: "language", context: context),
      body: ListView.builder(
        itemCount: languages.length,
        itemBuilder: (context, index) {
          return RadioListTile<String>(
            title: Text(languages[index]),
            value: languages[index],
            groupValue: _selectedLanguage,
            activeColor: Colors.purple,
            onChanged: (value) {
              setState(() {
                _selectedLanguage = value!;
              });
            },
          );
        },
      ),
    );
  }
}
