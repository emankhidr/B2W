import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String _selectedValue = '';
  final List<String> _radioTexts = [
    "English",
    "Arabic",
    "Spanish",
    "Mandarin",
    "French",
    "Russian",
    "Hindi",
    "Portuguese",
    "German",
    "Italian",
    "Japanese",
    "Korean",
    "Dutch",
    "Swedish",
    "Vietnamese"
  ];
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
        title: Center(
          child: Text(
            "Language",
            style: TextStyle(
              color: AppColors.black,
              fontSize: 25,
              fontWeight: FontWeight.w400,
              fontFamily: 'Lato',
            ),
          ),
        ),
        elevation: 0,
        toolbarHeight: 100,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: List.generate(15, (index) {
              return Row(
                children: [
                  Radio<String>(
                    value: _radioTexts[index],
                    groupValue: _selectedValue,
                    activeColor: AppColors.primary,
                    fillColor: MaterialStateColor.resolveWith((states) {
                      return AppColors.primary;
                    }),
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value!;
                      });
                    },
                  ),
                  Text(
                    _radioTexts[index],

                    style: TextStyle(fontSize: 18,color: AppColors.darkGrey,fontWeight: FontWeight.w400),
                  ),

                ],
              );
            },
            ),


    ),

      ),
    ),
    );
  }
}
