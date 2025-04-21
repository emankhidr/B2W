import 'package:b2w/core/extentions/string.dart';
import 'package:b2w/core/route_Units/route_units.dart';
import 'package:b2w/views/user/nav_bar/nav_bar.dart';
import 'package:b2w/widget/app/app_buttons.dart';
import 'package:b2w/widget/app/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';

class SignLangaugeInterpreter extends StatefulWidget {
  const SignLangaugeInterpreter({super.key});

  @override
  State<SignLangaugeInterpreter> createState() => _SignLangaugeInterpreterState();
}

class _SignLangaugeInterpreterState extends State<SignLangaugeInterpreter> {
  bool isRecording = false; // Flag to track if recording is in progress
  String translatedText = ''; // Holds the translated text
  String buttonImage = 'Start'.assetPNG; // Initial image
  String buttonText = 'Start'; // Initial text for the button
  // Function to simulate the translation process
  void toggleRecording() {
    setState(() {
      isRecording = !isRecording;

      if (isRecording) {
        // Change to "Stop" when recording starts
        buttonImage = 'Stop'.assetPNG;

        translatedText = ''; // Reset the text while recording
      } else {
        // After stopping, change to "Start"
        buttonImage = 'Start'.assetPNG;


        // Simulating the translated text
        translatedText = 'Translated sign language text';
      }
    });
  }

  // Function to simulate replay action
  void replayTranslation() {
    setState(() {
      translatedText = ''; // Clear the text to start a new translation
      isRecording = false;
      buttonImage = 'Start'.assetPNG;
      buttonText = 'Start';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(Icons.arrow_back_ios, color: AppColors.black, size: 40,),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Center(
          child: Text(
            "Signify",
            style: TextStyle(color: AppColors.black,
                fontSize: 25,
                fontWeight: FontWeight.w400,
                fontFamily: 'Lato'),
          ),
        ),
        elevation: 0,
        toolbarHeight: 100,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              Center(child: AppText(title: 'This AI-powered interpreter converts sign\n           language into Text.',
              color: AppColors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,)),
              SizedBox(
                height:20.h ,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  // Background image
                  Image.asset(
                    'video recorder'.assetPNG, // Path to your background image
                    width: 358.w,
                    height: 400.h,
                    fit: BoxFit.cover,
                  ),
                  // Foreground image (Start or Stop image)
                  GestureDetector(
                    onTap: toggleRecording,
                    child: Image.asset(
                      buttonImage, // 'Start' or 'Stop'
                      width: 100,
                      height: 100,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 200,
                  color: AppColors.grey, // Set the height to maximize the text area
                  child: TextField(
                    maxLines: null, // Allows the text field to expand vertically
                    controller: TextEditingController(text: translatedText),
                    decoration: InputDecoration(
                      filled: true, // Makes the background color visible
                      fillColor: AppColors.grey, // Grey background color
                      hintText: 'Translate text', // Hint text inside the field
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        borderSide: BorderSide.none, // No border
                      ),
                    ),
                    readOnly: true, // Make the text field read-only
                  ),
                ),
              ),
              if (!isRecording && translatedText.isNotEmpty) ...[
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                     InkWell(
                       onTap: (){
                         RouteUtils.push(context, NavBarScreen());
                       },
                       child: Container(
                         width: 150.w,
                         height: 48.h,
                         decoration: BoxDecoration(
                           color: AppColors.primary,
                           borderRadius: BorderRadius.circular(12.r),

                         ),
                         child: Center(
                           child: Text('End',style: TextStyle(
                             color: AppColors.white,
                             fontWeight: FontWeight.w500,
                             fontSize:18,
                           ),),
                         ),
                       ),
                     ),
                      SizedBox(
                        width: 18.w,
                      ),
                      InkWell(
                        onTap: (){
                          RouteUtils.push(context, SignLangaugeInterpreter());
                        },
                        child: Expanded(
                          child: Container(
                            width: 150.w,
                            height: 48.h,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(
                                color: AppColors.primary
                              )
                            ),
                              child: Center(
                                child: Text('Reply',style: TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w500,
                                fontSize:18,
                                                            ),),
                              ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
