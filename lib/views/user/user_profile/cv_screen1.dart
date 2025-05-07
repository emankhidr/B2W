
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';
import '../../../widget/app/app_text.dart';

class CvScreen1 extends StatefulWidget {
  const CvScreen1({super.key});

  @override
  State<CvScreen1> createState() => _CvScreen1State();
}

class _CvScreen1State extends State<CvScreen1> {
  File? _uploadedFile;
  String? _fileName;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (result != null) {
      setState(() {
        _uploadedFile = File(result.files.single.path!);
        _fileName = result.files.single.name;
      });
    }
  }
  void _deleteFile() {
    setState(() {
      _uploadedFile = null;
      _fileName = null;
    });
  }
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
            "Edit CV",
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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(title: 'Upload your resume (CV)',color: AppColors.inputText,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,),
                ],
              ),
          SizedBox(
            height: 16,
          ),
          Center(
            child: Container(
              width: 358.w,
              height: 167.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(color: AppColors.grey, width: 1),
              ),
              child: InkWell(
                onTap: _uploadedFile == null ? _pickFile : _deleteFile,
                child: Center(
                  child: _uploadedFile == null
                      ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.upload_file, size: 40, color: AppColors.primary),

                    ],
                  )
                      : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.description, size: 40, color: AppColors.black),
                      SizedBox(height: 8.h),
                      Text(
                        _fileName ?? '',
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 16.sp,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "Tap to Remove",
                        style: TextStyle(color: Colors.red, fontSize: 14.sp),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: InkWell(
                  onTap: (){},
                  child: Container(
                    width: 358,
                    height: 42,
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(15.r),
                      border: Border.all(
                        color: AppColors.lightGrey,
                      ),

                    ),
                    child: Center(
                      child: Text(
                        'Save',
                        style: TextStyle(
                          color: AppColors.darkGrey,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
